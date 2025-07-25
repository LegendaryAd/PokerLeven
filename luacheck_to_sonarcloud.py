import re
import sys
import json

def parse_luacheck_line(line):
    # Ejemplo línea típica:
    # path/to/file.lua:130:7: (W213) unused loop variable 'k'
    pattern = r"^(.*):(\d+):(\d+): \((\w\d+)\) (.*)$"
    m = re.match(pattern, line)
    if m:
        file_path, line_no, col_no, code, message = m.groups()
        return file_path, int(line_no), int(col_no), code, message
    return None

def severity_from_code(code):
    # Mapear códigos a severidad SonarCloud
    # E = error crítico, W = warning menor, otro = info
    if code.startswith("E"):
        return "CRITICAL"
    elif code.startswith("W"):
        return "MINOR"
    else:
        return "INFO"

def safe_text_range(line_content, col_start):
    line_len = len(line_content)
    start_col = col_start
    if start_col > line_len:
        # Si la columna inicio es mayor que la longitud de la línea,
        # ponerla en la última posición válida (o 1 si línea vacía)
        start_col = line_len if line_len > 0 else 1
    # endColumn debe ser >= startColumn y <= line_len + 1 (según Sonar)
    # Para evitar problemas, límite end_col a line_len
    end_col = start_col + 1
    if end_col > line_len + 1:
        end_col = line_len + 1
    if end_col < start_col:
        end_col = start_col
    return start_col, end_col

def main(input_file, output_file):
    # Leemos todo el contenido para validar columnas
    file_contents = {}
    with open(input_file, encoding='utf-8') as f:
        lines = f.readlines()

    # Leemos todos los archivos referenciados para validar columnas
    # Primero recogemos los paths únicos
    paths = set()
    for line in lines:
        parsed = parse_luacheck_line(line.strip())
        if parsed:
            file_path, _, _, _, _ = parsed
            paths.add(file_path)

    # Cargamos contenido de cada archivo en dict {file_path: [line1, line2, ...]}
    for path in paths:
        try:
            with open(path, encoding='utf-8') as f:
                file_contents[path] = f.readlines()
        except FileNotFoundError:
            # Si no existe el archivo, ponemos lista vacía para evitar error
            file_contents[path] = []

    issues = []
    for line in lines:
        parsed = parse_luacheck_line(line.strip())
        if parsed:
            file_path, line_no, col_no, code, message = parsed

            # Sacar línea real del archivo, si no existe usar cadena vacía
            file_lines = file_contents.get(file_path, [])
            if 1 <= line_no <= len(file_lines):
                line_content = file_lines[line_no - 1].rstrip('\n').rstrip('\r')
            else:
                line_content = ""

            start_col, end_col = safe_text_range(line_content, col_no)

            issue = {
                "engineId": "luacheck",
                "ruleId": code,
                "severity": severity_from_code(code),
                "type": "CODE_SMELL",
                "primaryLocation": {
                    "message": f"{code}: {message}",
                    "filePath": file_path,
                    "textRange": {
                        "startLine": line_no,
                        "endLine": line_no,
                        "startColumn": start_col,
                        "endColumn": end_col
                    }
                }
            }
            issues.append(issue)

    with open(output_file, 'w', encoding='utf-8') as out_f:
        json.dump({"issues": issues}, out_f, indent=2, ensure_ascii=False)

    print(f"Archivo JSON generado: {output_file}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Uso: python luacheck_to_sonarjson.py luacheck_report.txt luacheck-sonar.json")
        sys.exit(1)
    main(sys.argv[1], sys.argv[2])
