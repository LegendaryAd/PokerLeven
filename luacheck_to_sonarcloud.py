import re
import sys
import json
import os

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
    # E = error -> CRITICAL, W = warning -> MINOR, otros -> INFO
    if code.startswith("E"):
        return "CRITICAL"
    elif code.startswith("W"):
        return "MINOR"
    else:
        return "INFO"

def load_file_lines(file_path):
    try:
        with open(file_path, encoding='utf-8') as f:
            return f.readlines()
    except Exception:
        # Si no se puede abrir el archivo (no existe o error), devolvemos lista vacía
        return []

def main(input_file, output_file):
    issues = []
    files_cache = {}  # Cache para evitar abrir el mismo archivo repetidas veces

    with open(input_file, encoding='utf-8') as f:
        for line in f:
            parsed = parse_luacheck_line(line.strip())
            if parsed:
                file_path, line_no, col_no, code, message = parsed

                # Cargar líneas del archivo si no están cacheadas
                if file_path not in files_cache:
                    # Si la ruta es relativa, ajusta si hace falta:
                    if not os.path.isfile(file_path):
                        # Si no encuentra el archivo con esa ruta, prueba a buscar relativo a cwd
                        file_path_rel = os.path.join(os.getcwd(), file_path)
                        if os.path.isfile(file_path_rel):
                            file_path_to_read = file_path_rel
                        else:
                            file_path_to_read = file_path
                    else:
                        file_path_to_read = file_path

                    files_cache[file_path] = load_file_lines(file_path_to_read)

                file_lines = files_cache[file_path]

                # Obtener longitud de la línea para validar columnas
                if 0 < line_no <= len(file_lines):
                    line_content = file_lines[line_no - 1].rstrip('\n').rstrip('\r')
                    line_len = len(line_content)
                else:
                    line_len = 0

                start_line = line_no
                end_line = line_no
                start_col = col_no

                # Ajustar end_col para que no supere la longitud de la línea
                end_col = start_col + 1
                if end_col > line_len:
                    end_col = line_len
                if end_col <= start_col:
                    # En caso extremo, pon end_col un caracter más adelante para que sea válido
                    end_col = start_col + 1

                issue = {
                    "engineId": "luacheck",
                    "ruleId": code,
                    "severity": severity_from_code(code),
                    "type": "CODE_SMELL",
                    "primaryLocation": {
                        "message": f"{code}: {message}",
                        "filePath": file_path,
                        "textRange": {
                            "startLine": start_line,
                            "endLine": end_line,
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
