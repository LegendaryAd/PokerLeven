import sys
import json
import re

def luacheck_level_to_severity(code):
    """Map Luacheck warning codes to Sonar severity levels."""
    if code.startswith("1"):  # style, unused, etc.
        return "MINOR"
    elif code.startswith("2"):  # possible bugs
        return "MAJOR"
    elif code.startswith("3"):  # serious bugs
        return "CRITICAL"
    else:
        return "INFO"

def main(input_file, output_file):
    issues = []

    # Ejemplo línea plain: path/to/file.lua:10:5: (211) unused variable 'x'
    pattern = re.compile(r"^(.*):(\d+):(\d+): \((\d+)\) (.*)$")

    with open(input_file, 'r') as f:
        for line in f:
            line = line.strip()
            match = pattern.match(line)
            if match:
                filepath, line_num, col_num, code, message = match.groups()
                issue = {
                    "engineId": "luacheck",
                    "ruleId": code,
                    "type": "CODE_SMELL",
                    "severity": luacheck_level_to_severity(code),
                    "primaryLocation": {
                        "message": message,
                        "filePath": filepath,
                        "textRange": {
                            "startLine": int(line_num),
                            "startColumn": int(col_num),
                            "endLine": int(line_num),
                            "endColumn": int(col_num) + 1
                        }
                    }
                }
                issues.append(issue)

    with open(output_file, 'w') as f:
        json.dump({"issues": issues}, f, indent=2)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python luacheck_to_sonarcloud.py input.txt output.json")
        sys.exit(1)
    main(sys.argv[1], sys.argv[2])
