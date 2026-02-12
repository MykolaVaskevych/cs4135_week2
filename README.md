# BidHub — Irish Local Auction Platform

## Team Members

| # | Name | Student ID | Role |
|---|------|------------|------|
| 1 | Mykola Vaskevych | 22372199 | Full Stack Dev & QA |
| 2 | Xunze Tan | 24247472 | Leader & Full Stack Dev |
| 3 | Zitao Zhang | 24247464 | Full Stack Dev |
| 4 | Zihan Zhuo | 24247456 | Frontend Dev |
| 5 | Oliver Fitgerald | 22365958 | Full Stack Dev |

**Communication channels:**

- **WhatsApp** — primary team communication, daily standups, scheduling
- **GitHub Issues** — task tracking, bug reports, feature requests
- **GitHub Projects** — sprint planning and progress tracking
- **GitHub Pull Requests** — code reviews and technical discussions

## Application Scenario

### Problem Statement

Irish classifieds platforms such as adverts.ie and DoneDeal rely exclusively on fixed-price listings. While adverts.ie serves over 1 million users with 850K+ active listings, the platform suffers from well-documented pain points:

- **Scams and fraud** — no built-in trust mechanism; buyers and sellers must rely on good faith
- **No price discovery** — sellers guess a price and hope for the best; buyers have no way to negotiate transparently
- **Stale listings** — items sit unsold for weeks or months with no expiry pressure
- **Pricing uncertainty** — sellers frequently overprice or underprice because there is no market signal
- **Low buyer engagement** — fixed prices offer no interactive or competitive buying experience

Despite these issues, **no auction-based alternative exists in the Irish market**. eBay serves a global audience but lacks local focus, and no platform combines auction mechanics with the local, community-driven feel of Irish classifieds.

### Proposed Solution — BidHub

**BidHub** is a web-based auction platform designed specifically for the Irish market. Instead of fixed prices, competitive bidding determines fair market value transparently.

Key features:

- **Time-limited auctions** (1–7 days) keep the marketplace fresh — no stale listings
- **Competitive bidding** lets the market decide fair value, removing pricing guesswork
- **Bidding activity as a trust signal** — multiple bidders on an item indicate legitimacy and desirability
- **Wallet system** with transparent transaction history for all purchases and sales
- **Buy-now option** for buyers who want an instant purchase at a fixed price
- **In-app notifications** keep users engaged when they are outbid or an auction ends

### Target Users

- **Sellers** — individuals or small businesses auctioning used goods, collectibles, electronics, furniture, and more
- **Buyers** — bargain hunters, collectors, and anyone looking for fair-price deals through competitive bidding
- **Admins** — platform moderators managing categories, users, and content

### Academic Context

BidHub is a CS4135 Software Architecture group project demonstrating full-stack development, RESTful API design, and collaborative software engineering using React + Spring Boot.

## Project Requirements

### Functional Requirements — Buyer

| ID | Requirement | Priority |
|----|-------------|----------|
| B1 | Register with username, email, password, display name | Must |
| B2 | Log in / log out with JWT-based auth | Must |
| B3 | Browse active auctions (paginated, sortable) | Must |
| B4 | Search auctions by keyword | Must |
| B5 | Filter by category, price range, status | Must |
| B6 | View auction detail: photos, description, seller info, current bid, countdown timer, bid history | Must |
| B7 | Place a bid (must exceed current highest by ≥€1, server-validated) | Must |
| B8 | Buy Now — instantly win at listed buy-now price | Should |
| B9 | Watchlist — add/remove favourite auctions | Should |
| B10 | Dashboard — active bids, won auctions, watchlist, wallet balance | Must |
| B11 | In-app notification when outbid | Must |
| B12 | In-app notification when auction ends (win/lose) | Must |
| B13 | Wallet top-up (mock — €10/€50/€100/€500 buttons) | Must |
| B14 | Winning bid deducted from wallet automatically | Must |
| B15 | Confirm delivery to release funds to seller | Should |
| B16 | View transaction history (top-ups, purchases, refunds) | Should |
| B17 | Edit profile (display name, avatar) | Should |
| B18 | Rate seller after completed transaction (1–5 stars) | Could |

### Functional Requirements — Seller

| ID | Requirement | Priority |
|----|-------------|----------|
| S1 | Create auction: title, description, category, photos (1–5), starting price, reserve price, buy-now price, duration | Must |
| S2 | Auction durations: 1, 3, 5, or 7 days | Must |
| S3 | View own listings with status (active/ended/sold) | Must |
| S4 | Edit listing only if zero bids | Should |
| S5 | Cancel listing only if zero bids | Should |
| S6 | View bids on own auction | Must |
| S7 | Notification when new bid placed | Must |
| S8 | Notification when auction ends (sold/unsold/reserve not met) | Must |
| S9 | Sale proceeds credited to wallet after buyer confirms delivery (minus 5% mock fee) | Should |

### Functional Requirements — Admin

| ID | Requirement | Priority |
|----|-------------|----------|
| A1 | Admin login (role-based, same auth system) | Must |
| A2 | Dashboard: total users, active auctions, completed sales, revenue | Must |
| A3 | View/search all users, ban/suspend/unban | Must |
| A4 | CRUD categories (flat list: Electronics, Vehicles, Furniture, etc.) | Must |
| A5 | View all auctions, remove rule-violating listings | Must |
| A6 | View and action user reports (dismiss or remove item) | Should |

### Non-Functional Requirements

| ID | Requirement |
|----|-------------|
| NF1 | Responsive UI (desktop + mobile) |
| NF2 | RESTful API with proper HTTP status codes |
| NF3 | Passwords hashed with BCrypt |
| NF4 | Auction deadlines enforced by server-side scheduled job |
| NF5 | Bid placement is atomic (optimistic locking to prevent race conditions) |
| NF6 | All monetary values stored as BigDecimal / NUMERIC(12,2) |
| NF7 | Input validation on both frontend and backend |
| NF8 | Consistent error response format from API |

### Technology Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React 19, Vite 7, React Router, ESLint, Playwright |
| Backend | Spring Boot 3.5, Java 21, Maven, Spring Security + JWT, Spring Data JPA |
| Database | PostgreSQL (prod), H2 (dev) |
| Testing | Bruno CLI (API), Playwright (E2E), JUnit 5 (unit) |
| CI/CD | GitHub Actions |
| DevOps | Docker, Lefthook, Husky + lint-staged |
| Code Quality | Spotless + Google Java Format, ESLint |

### Simplifications (Pet Project Scope)

- Payments are mock (wallet top-up buttons, no real payment gateway)
- Notifications are in-app only (no email/SMS)
- "Delivery" is a confirmation button + notification (no real shipping integration)
- Image storage on local filesystem (no S3/cloud storage)
- No real-time WebSocket bidding (page refresh or polling)

## Project Setup (Marking Scheme) – 5 Marks

| Criteria | Status | Excellent (Full Marks) | Good | Basic | Poor (0 Marks) | Marks |
|----------|--------|----------------------|------|-------|-----------------|-------|
| **Team Formation & Organisation** | :white_check_mark: | Team is fully formed, roles are clearly assigned, and communication channels are established. | Team formed with minor gaps in roles or organisation. | Team formed, but roles are unclear, or the communication setup is incomplete. | Team not clearly formed or no organisation evident. | 1 |
| **Application Scenario Description** | :white_check_mark: | The scenario is clear, detailed, well-structured, and provides a strong context for the project. | The scenario is generally clear with minor missing details. | The scenario is vague, incomplete, or lacks clarity. | No scenario or extremely poor description. | 1 |
| **Basic Project Requirements** | :white_check_mark: | Requirements are well-defined, relevant, and logically derived from the scenario. | Requirements are mostly clear with some minor gaps. | Limited or unclear requirements; missing key elements. | No requirements or irrelevant content. | 1 |
| **GitHub/GitLab Repository Setup** | :white_check_mark: | Repository fully created, well-structured, includes README, folders, and proper version control practices. | Repository created with basic structure; minor improvements needed. | The repository exists, but poorly structured or missing documentation. | No repository or unusable structure. | 1 |
| **Wiki Setup for Collaboration & Documentation** | :white_check_mark: | Wiki created with clear structure, sections for documentation, and visible team contributions. | Wiki is set up but incomplete or lacking some structure. | Wiki minimally created; poor organization or missing content. | No Wiki created. | 1 |

---

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
