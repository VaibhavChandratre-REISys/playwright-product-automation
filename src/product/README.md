# Project Template

Copy this folder to create a new project. For example, to add a project called `newproject`:

```bash
cp -r src/_template src/newproject
```

## Required structure

```
src/newproject/
├── api/
│   └── api-config.ts          # Project-specific API payloads (implements ProjectApiConfig)
├── config/
│   └── properties/             # .properties files (e.g. AUTOEnvData.properties)
├── data/                       # Test data files (Excel, attachments)
├── features/                   # Gherkin .feature files
└── step-definitions/           # Project-specific step definitions (optional)
```

## Running tests

```bash
# Set PROJECT env var to your project folder name
cross-env PROJECT=newproject npx cucumber-js
```

## How it works

- `cucumber.js` loads step definitions from **both** `src/framework/step-definitions/` and `src/<project>/step-definitions/`.
- Features are loaded from `src/<project>/features/`.
- Properties are loaded from `src/<project>/config/properties/`.
- API payloads use project-specific config from `src/<project>/api/api-config.ts`.
- The `PROJECT` environment variable drives all path resolution via `getProject()`.
