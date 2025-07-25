import sys
import json

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
    with open(input_file, 'r') as f:
        data = json.load(f)

    issues = []
    for file in data:
        for warning in file.get("warnings", []):
            issue = {
                "engineId": "luacheck",
                "ruleId": warning["code"],
                "type": "CODE_SMELL",
                "severity": luacheck_level_to_severity(str(warning["code"])),
                "primaryLocation": {
                    "message": warning["message"],
                    "filePath": file["file"],
                    "textRange": {
                        "startLine": warning["line"],
                        "startColumn": warning.get("column", 1),
                        "endLine": warning["line"],
                        "endColumn": warning.get("end_column", warning.get("column", 1) + 1)
                    }
                }
            }
            issues.append(issue)

    with open(output_file, 'w') as f:
        json.dump({"issues": issues}, f, indent=2)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python luacheck_to_sonarcloud.py input.json output.json")
        sys.exit(1)
    main(sys.argv[1], sys.argv[2])
