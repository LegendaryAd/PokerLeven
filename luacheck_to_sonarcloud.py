import re
import sys
import xml.etree.ElementTree as ET

def parse_luacheck_line(line):
    # Ejemplo línea típica:
    # path/to/file.lua:130:7: (W213) unused loop variable 'k'
    pattern = r"^(.*):(\d+):(\d+): \((\w\d+)\) (.*)$"
    m = re.match(pattern, line)
    if m:
        file_path, line_no, col_no, code, message = m.groups()
        return file_path, int(line_no), int(col_no), code, message
    return None

def main(input_file, output_file):
    files = {}
    with open(input_file, encoding='utf-8') as f:
        for line in f:
            parsed = parse_luacheck_line(line.strip())
            if parsed:
                file_path, line_no, col_no, code, message = parsed
                if file_path not in files:
                    files[file_path] = []
                files[file_path].append({
                    "line": line_no,
                    "column": col_no,
                    "severity": "warning" if code.startswith("W") else "error",
                    "message": message,
                    "code": code
                })

    # Construir XML Checkstyle
    root = ET.Element("checkstyle", version="4.3")

    for file_path, issues in files.items():
        file_elem = ET.SubElement(root, "file", name=file_path)
        for issue in issues:
            ET.SubElement(file_elem, "error", 
                line=str(issue["line"]),
                column=str(issue["column"]),
                severity=issue["severity"],
                message=f"{issue['code']}: {issue['message']}",
                source="luacheck"
            )

    tree = ET.ElementTree(root)
    tree.write(output_file, encoding="utf-8", xml_declaration=True)
    print(f"Archivo XML generado: {output_file}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Uso: python luacheck_to_checkstyle.py luacheck_report.txt luacheck_report.xml")
        sys.exit(1)
    main(sys.argv[1], sys.argv[2])
