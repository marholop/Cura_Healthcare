import json
import re
import sys

def parse_rflint_log(log_file):
    issues = []
    current_file = None
    pattern_file = re.compile(r"^\+ (.+)$")
    pattern_issue = re.compile(r"^(?P<level>[EW]): (?P<line>\d+), \d+: (?P<message>.+) \((?P<rule>.+)\)$")

    with open(log_file, "r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()

            # file path
            match_file = pattern_file.match(line)
            if match_file:
                current_file = match_file.group(1)
                continue

            # issue line
            match_issue = pattern_issue.match(line)
            if match_issue and current_file:
                severity = "MAJOR" if match_issue.group("level") == "E" else "MINOR"

                issues.append({
                    "engineId": "rflint",
                    "ruleId": match_issue.group("rule"),
                    "severity": severity,
                    "type": "CODE_SMELL",
                    "primaryLocation": {
                        "message": match_issue.group("message"),
                        "filePath": current_file,
                        "textRange": {
                            "startLine": int(match_issue.group("line")),
                            "endLine": int(match_issue.group("line"))
                        }
                    }
                })

    return {"issues": issues}


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python convert_rflint_to_sonar.py rflint.log output.json")
        sys.exit(1)

    log_file = sys.argv[1]
    output_file = sys.argv[2]

    data = parse_rflint_log(log_file)

    with open(output_file, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2)

    print(f"Converted {log_file} -> {output_file}")
