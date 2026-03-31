# 📖 Scribe - The Docs Writer

> Your AI documentation writer that creates READMEs, API docs, and guides from your codebase.

## Overview

Scribe writes and maintains your documentation:

- Generates README files from codebase analysis
- Creates API documentation with examples
- Writes setup guides and tutorials
- Keeps docs in sync with code changes

## Quick Start

### Installation

```bash
mkdir -p ~/.openclaw/agents/docs-writer/agent
cp SOUL.md ~/.openclaw/agents/docs-writer/agent/

openclaw agents add docs-writer --workspace ~/.openclaw/agents/docs-writer
```

### First Conversation

```bash
openclaw chat docs-writer "Write a README for this project"
```

## Use Cases

### 1. README Generation
```
You: "Write a README for this project"
Scribe: [Full README with description, quick start, features, usage, API, config]
```

### 2. API Documentation
```
You: "Document the /api/generate endpoint"
Scribe: [Parameters, return values, code examples, error cases]
```

### 3. Function Documentation
```
You: "Add JSDoc to this function"
Scribe: [Complete JSDoc with params, returns, examples, throws]
```

### 4. Setup Guide
```
You: "Write a setup guide for new developers"
Scribe: [Prerequisites, step-by-step, expected output, common errors]
```

## Example Outputs

### README

```
# AI2SQL

Convert natural language to SQL queries.

## Quick Start
npm install && npm run dev
Type: "Show users who signed up this week"

## Features
- MySQL, PostgreSQL, SQLite support
- Schema-aware queries
- CSV export
```

### JSDoc

```typescript
/**
 * Generates SQL from natural language.
 * @param prompt - Description of desired query
 * @param options.dialect - SQL dialect (default: postgresql)
 * @returns Generated SQL and explanation
 * @example
 * await generateSQL("Find active users");
 */
```

## Tips

1. **Point to your codebase** - Scribe reads files for accurate docs
2. **Ask for specific formats** - README, API doc, JSDoc, guide
3. **Review examples** - Make sure code samples actually work
4. **Update regularly** - Run Scribe after major changes

## Changelog

- **v1.0.0** - Initial release with README generation
- **v1.1.0** - API documentation and JSDoc
- **v1.2.0** - Setup guides and tutorials

## Author

Created by [@openclaw](https://github.com/openclaw)

## License

MIT
