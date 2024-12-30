# GSMArena Phone Comparison Automation

This project automates the comparison of display specifications between two Samsung phones on GSMArena using Robot Framework.

## Prerequisites

- Python 3.x
- Chrome/Chromium browser
- ChromeDriver
- Ubuntu (or any Linux distribution)

## Setup

1. Create and activate virtual environment:
```bash
python3 -m venv venv
source venv/bin/activate
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

## Project Structure

```
samsung_comparison/
│
├── requirements.txt    # Python dependencies
├── resources/
│   └── common.resource    # Common keywords and variables
├── tests/
│   └── phone_comparison_test.robot    # Test cases
└── results/    # Test execution results
```

## Running Tests

Execute the following command from the project root:
```bash
robot -d results tests/phone_comparison_test.robot
```

## Test Reports

After execution, find the reports in the `results` directory:
- report.html: Detailed test execution report
- log.html: Detailed test logs
- output.xml: Raw output data