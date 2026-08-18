# ParaBank Automation

UI test automation framework for [ParaBank](https://parabank.parasoft.com/parabank/index.htm) — Parasoft's demo banking application — built with **Robot Framework** and **SeleniumLibrary**.

This project is a practice framework for building senior-level automation skills, following a Page Object Model (POM) design and a domain-first folder structure.

## Tech Stack

- **Robot Framework** — test automation framework
- **SeleniumLibrary** — browser automation
- **Python 3** — underlying runtime
- **uBlock Origin (Lite)** — loaded via Chrome options to suppress ads/popups during test execution

## Project Structure

```
ParaBank_Automation/
├── Config/                 # Global environment variables (browser, base URL, timeouts)
│   └── Global_Variables.robot
├── Resources/
│   ├── Common/              # Reusable, page-agnostic keywords
│   │   ├── BrowserKeyword.resource   # Browser init, ad-blocking, teardown
│   │   └── CommonKeyword.resource    # Generic click/input/verify/text helpers
│   └── Pages/                # Page Object Model — one file per page
│       ├── Login.resource
│       └── Registration.resource
├── TestData/                # Test data, separated from locators and logic
│   ├── Login_Data.robot
│   └── Registration_Data.robot
├── Tests/                    # Test suites
│   ├── Login_Tests.robot
│   └── Registration_Tests.robot
├── Extensions/                # uBlock Origin (Lite) unpacked extension (not committed)
└── Results/                   # Test execution output — log.html, report.html (not committed)
```

## Design Principles

- **Page Object Model (POM):** locators and page-specific actions live in `Resources/Pages/`; test cases never reference locators directly.
- **Separation of concerns:** environment config (`Config/`), reusable logic (`Resources/Common/`), page objects (`Resources/Pages/`), and test data (`TestData/`) are kept independent.
- **Tagging:** test cases are tagged by priority (`P1`/`P2`/`P3`) and type (`smoke`/`regression`) as independent dimensions, enabling flexible test selection.
- **Ad-blocking:** ParaBank/demo sites can include ads/popups that interfere with element interactions; uBlock Origin is loaded via Chrome options for the whole browser session.

## Setup

1. Install dependencies:
   ```bash
   pip install robotframework robotframework-seleniumlibrary --break-system-packages
   ```
2. Copy an unpacked **uBlock Origin (Lite)** extension folder into `Extensions/UBlock_Origin/` (not included in this repo).
3. Update `Config/Global_Variables.robot` if your local extension path differs.

## Running Tests

Run a specific suite:
```bash
robot --outputdir Results Tests/Login_Tests.robot
```

Run all tests:
```bash
robot --outputdir Results Tests/
```

Run by tag (e.g. only smoke tests):
```bash
robot --outputdir Results --include smoke Tests/
```

## Test Coverage (in progress)

- [x] Login — valid credentials
- [x] Login — invalid credentials
- [x] Registration — new user signup
- [ ] Account Overview
- [ ] Transfer Funds
- [ ] Bill Pay
- [ ] Find Transactions

## Author

Mahmoud Elsayed Madboly — Senior Software Test Engineer
