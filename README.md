# CS4135 Week 2

## Team Members

| # | Name | Student ID | Role |
|---|------|------------|------|
| 1 | Mykola Vaskevych | 22372199 | Full Stack Dev & QA |
| 2 | Xunze Tan | 24247472 | Leader & Full Stack Dev |
| 3 | Zitao Zhang | 24247464 | Full Stack Dev |
| 4 | Zihan Zhuo | 24247456 | Frontend Dev |
| 5 | Oliver Fitgerald | 22365958 | Full Stack Dev |

**Communication channels:**

TODO:

## Application Scenario

TODO:

## Project Requirements

TODO

## Project Setup (Marking Scheme) – 5 Marks

| Criteria | Status | Excellent (Full Marks) | Good | Basic | Poor (0 Marks) | Marks |
|----------|--------|----------------------|------|-------|-----------------|-------|
| **Team Formation & Organisation** | :x: | Team is fully formed, roles are clearly assigned, and communication channels are established. | Team formed with minor gaps in roles or organisation. | Team formed, but roles are unclear, or the communication setup is incomplete. | Team not clearly formed or no organisation evident. | 1 |
| **Application Scenario Description** | :x: | The scenario is clear, detailed, well-structured, and provides a strong context for the project. | The scenario is generally clear with minor missing details. | The scenario is vague, incomplete, or lacks clarity. | No scenario or extremely poor description. | 1 |
| **Basic Project Requirements** | :x: | Requirements are well-defined, relevant, and logically derived from the scenario. | Requirements are mostly clear with some minor gaps. | Limited or unclear requirements; missing key elements. | No requirements or irrelevant content. | 1 |
| **GitHub/GitLab Repository Setup** | :white_check_mark: | Repository fully created, well-structured, includes README, folders, and proper version control practices. | Repository created with basic structure; minor improvements needed. | The repository exists, but poorly structured or missing documentation. | No repository or unusable structure. | 1 |
| **Wiki Setup for Collaboration & Documentation** | :x: | Wiki created with clear structure, sections for documentation, and visible team contributions. | Wiki is set up but incomplete or lacking some structure. | Wiki minimally created; poor organization or missing content. | No Wiki created. | 1 |

---

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
