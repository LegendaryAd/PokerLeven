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
    if code.startswith("E1") or code.startswith("E5") or code.startswith("E6"):
        return "BLOCKER"
    elif code.startswith("E"):
        return "CRITICAL"
    elif code.startswith("W2") or code.startswith("W3"):
        return "MAJOR"
    elif code.startswith("W"):
        return "MINOR"
    else:
        return "INFO"

def main(input_file, output_file):
    issues = []
    with open(input_file, encoding='utf-8') as f:
        for line in f:
            parsed = parse_luacheck_line(line.strip())
            if parsed:
                file_path, line_no, col_no, code, message = parsed

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
                            "endLine": line_no
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
