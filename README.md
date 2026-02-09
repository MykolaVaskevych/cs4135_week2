# CS4135 Week 2

[![StandWithUkraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/README.md)
[![Integration](https://github.com/MykolaVaskevych/cs4135_week2/actions/workflows/integration.yml/badge.svg)](https://github.com/MykolaVaskevych/cs4135_week2/actions/workflows/integration.yml)
[![Frontend CI](https://github.com/MykolaVaskevych/cs4135_week2_frontend/actions/workflows/ci.yml/badge.svg)](https://github.com/MykolaVaskevych/cs4135_week2_frontend/actions/workflows/ci.yml)
[![Backend CI](https://github.com/MykolaVaskevych/cs4135_week2_backend/actions/workflows/ci.yml/badge.svg)](https://github.com/MykolaVaskevych/cs4135_week2_backend/actions/workflows/ci.yml)

## Requirements

- Node.js
- Java (OpenJDK 21)
- Docker
- Lefthook
- Bruno & Bruno CLI (API testing)

### Version Managers (extra, just in case if you will need it)

- `nvm` / `fnm` - Node.js version switching
- `sdkman` - JDK version switching
- `archlinux-java` - JDK switching (Arch) <-- PS: i use this one :)
- `jenv` - JDK switching (macOS)

---

Monorepo with git submodules for frontend (React + Vite) and backend (Spring Boot).

## Repository Structure

```
cs4135_week2/          # Parent repo
├── frontend/          # Submodule -> cs4135_week2_frontend
├── backend/           # Submodule -> cs4135_week2_backend
├── lefthook.yml       # Git hooks config
└── .github/workflows/ # Integration CI
```

## Branch Strategy

| Branch | Purpose |
|--------|---------|
| `main` | Production - protected, requires PR |
| `development` | Default branch for development |

## Cloning the Project

```bash
# Clone with submodules
git clone --recurse-submodules git@github.com:MykolaVaskevych/cs4135_week2.git

# Or if already cloned without submodules
git submodule update --init --recursive
```

## Running the Project

### Frontend (React + Vite)

```bash
cd frontend
npm install
npm run dev
# Runs on http://localhost:5173
```

### Backend (Spring Boot)

```bash
cd backend
./mvnw spring-boot:run
# Runs on http://localhost:8080
```

## Pre-commit Hooks

Install [Lefthook](https://github.com/evilmartians/lefthook) for automatic submodule updates:

```bash
lefthook install
```

Hooks:

- `post-checkout`: Auto-update submodules
- `post-merge`: Auto-update submodules

## Making Changes

### 1. Working in a Submodule

```bash
cd frontend  # or backend
# Make changes, commit, push
git add .
git commit -m "your message"
git push origin development
```

### 2. Updating Parent

After committing in a submodule:

```bash
cd ..  # back to parent
git add frontend  # or backend
git commit -m "Update frontend submodule"
git push origin development
```

## Deployment

Create a PR from `development` to `main`. CI must pass before merge.

```bash
# Or via CLI
gh pr create --base main --head development
```
