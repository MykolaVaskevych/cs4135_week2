# cs4135_week2

Monorepo with git submodules for frontend (React + Vite) and backend (Spring Boot).

## Repository Structure

```
cs4135_week2/          # Parent repo
├── frontend/          # Submodule -> cs4135_week2_frontend
├── backend/           # Submodule -> cs4135_week2_backend
└── README.md
```

## Branch Strategy

| Branch | Purpose |
|--------|---------|
| `main` | Production/deployment - submodules point to their `main` branches |
| `develop-nick` | Development - submodules point to their `develop-nick` branches |

## Cloning the Project

```bash
# Clone with submodules
git clone --recurse-submodules git@github.com:MykolaVaskevych/cs4135_week2.git

# Or if already cloned without submodules
git submodule update --init --recursive
```

## Switching Branches

When switching branches in the parent, submodules don't auto-switch. Always run:

```bash
git checkout develop-nick
git submodule update --recursive
```

## Making Changes

### 1. Working in a Submodule (frontend or backend)

```bash
cd frontend  # or backend

# Make sure you're on the right branch
git checkout develop-nick

# Make changes, then commit
git add .
git commit -m "your message"
git push origin develop-nick
```

### 2. Updating Parent to Track New Submodule Commits

After committing in a submodule, the parent repo sees it as "modified":

```bash
cd ..  # back to parent repo
git status
# Shows: modified: frontend (new commits)

# Stage the submodule reference update
git add frontend  # or backend
git commit -m "Update frontend submodule"
git push origin develop-nick
```

## Common Operations

### Pull Latest Changes (All Repos)

```bash
git pull origin develop-nick
git submodule update --recursive --remote
```

### Check Submodule Status

```bash
git submodule status
```

### See Which Commit Submodules Point To

```bash
git ls-tree HEAD frontend backend
```

## Important Rules

1. **Always commit in submodule first, then update parent** - Never commit parent without pushing submodule changes first
2. **Keep branches in sync** - When on `develop-nick` in parent, submodules should be on `develop-nick`
3. **Don't edit submodule files from parent without entering the submodule directory**
4. **After clone/pull, always run `git submodule update`** - Submodules don't auto-update

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
# H2 Console: http://localhost:8080/h2-console
```

## Merging to Main (Deployment)

```bash
# In each submodule first
cd frontend
git checkout main
git merge develop-nick
git push origin main

cd ../backend
git checkout main
git merge develop-nick
git push origin main

# Then in parent
cd ..
git checkout main
git submodule update
git add frontend backend
git commit -m "Update submodules for release"
git push origin main
```
