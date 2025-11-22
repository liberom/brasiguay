# Brasiguay - Setup & Deployment Guide

## Overview

Brasiguay is a Rails 7.1.3+ social network application for Brazilians relocating to Paraguay (VivaParaguay). This guide covers local development setup, the unified build process, and deployment to production.

**Current Status:**
- ✅ Rails 6→7 upgrade completed
- ✅ Dependencies resolved
- ✅ Shakapacker 9.3.0 configured for unified JS/CSS bundling
- ✅ Homepage fixed (root path now shows login page instead of dashboard)
- ✅ Foreman process manager configured for unified dev startup

---

## Local Development Setup

### Prerequisites

- **Ruby:** 3.3.5
- **Node.js:** 16+ (with npm)
- **PostgreSQL:** 13+ (for production; SQLite used in development)
- **Git**

### Initial Setup

```bash
cd brasiguay

# Install Ruby dependencies
bundle install

# Install JavaScript dependencies
npm install

# Set up database
bin/rails db:setup

# Optional: seed sample data
bin/rails db:seed
```

### Running the Application

#### Option 1: Unified Development (Recommended)

Starts webpack dev server and Rails server together:

```bash
npm run dev
# Or directly:
foreman start -f Procfile.dev
```

This runs both processes in one terminal. Access at http://localhost:3000

#### Option 2: Separate Terminals

If you prefer to run processes separately:

**Terminal 1 - Rails Server:**
```bash
bin/rails server
```

**Terminal 2 - Webpack Dev Server:**
```bash
bin/webpack-dev-server
# Or:
npm run dev:webpack
```

#### Option 3: Rails Only (No JS Changes)

If you're only working on backend:
```bash
bin/rails server
```

---

## Key Configuration Files

### Shakapacker Setup
- **Config:** `config/webpack/environment.js`
- **Webpack config:** `config/webpack/webpack.config.js`
- **Entry points:** `app/javascript/packs/` (each file becomes a bundled JS/CSS pack)

### Development Server
- **Procfile:** `Procfile.dev` - Defines web and webpack processes
- **Port:** 3000 (Rails), 3035 (Webpack dev server internally)

### Build Pipeline
- **CSS:** Shakapacker handles SCSS compilation
- **JavaScript:** Babel transpilation + ES6 modules
- **Assets:** Bootstrap 4, jQuery, FontAwesome 7, TinyMCE, Select2, DataTables 2.3+

---

## Important Improvements Made

### 1. Unified Build Process

**Before (Rails 6→7 Migration Issue):**
- Webpack and Rails server had to run separately in different terminals
- Frontend/backend were decoupled during the upgrade

**After:**
- Added `foreman` gem for process management
- Created `Procfile.dev` to run webpack + Rails together
- Added `npm run dev` script for one-command startup
- Shakapacker (v9.3.0) properly configured

**How It Works:**
```bash
npm run dev
# Runs: foreman start -f Procfile.dev
# Which runs both:
#  - bin/rails server -p 3000
#  - bin/webpack-dev-server
```

### 2. Homepage Route Fixed

**Before:**
```ruby
root :to => redirect('/dashboard/dashboard_v1')
```
This showed the admin dashboard instead of a login page for unauthenticated users.

**After:**
```ruby
root 'pages#login'
```
Now displays the login page at `/` for the public landing.

### 3. Dependencies Verified

All gems and npm packages are compatible with Rails 7.1.3:
- ✅ `rails >= 7.1.3.4`
- ✅ `shakapacker >= 6.0`
- ✅ `devise ~> 4.9`
- ✅ `carrierwave >= 3.0.0`
- ✅ All dev dependencies (Capybara, RSpec, Cucumber)

---

## Testing

### Run All Tests

```bash
bin/rails test
```

### Run Specific Test Files

```bash
bin/rails test test/models/user_test.rb
bin/rails test test/controllers/jobs_controller_test.rb
```

### System Tests (Browser-based)

```bash
bin/rails test:system
```

Tests use Minitest (primary) with RSpec/Capybara available.

---

## Database

### Development

SQLite is used for local development (see `config/database.yml`).

```bash
bin/rails db:setup              # Create, migrate, seed
bin/rails db:migrate            # Run pending migrations
bin/rails db:rollback           # Revert last migration
bin/rails db:reset              # Drop, create, migrate, seed (destructive!)
```

### Production

PostgreSQL is required for production. Update `config/database.yml` and set:
- `DATABASE_URL` environment variable or
- Database credentials in `config/credentials.yml.enc`

---

## Deployment to Render

### Prerequisites

1. Create a Render account (https://render.com)
2. Connect your GitHub repository
3. Ensure `.gitignore` excludes:
   - `config/master.key`
   - `.env`
   - `node_modules/`
   - `storage/`

### Steps

1. **Push to GitHub**
   ```bash
   git add .
   git commit -m "Rails 7 fixes: unified build, homepage route, foreman setup"
   git push origin main
   ```

2. **Create New Web Service on Render**
   - Name: `brasiguay` (or similar)
   - Environment: `Ruby`
   - Region: Choose closest to your users
   - Build command: `bundle install && npm install && npm run build`
   - Start command: `bin/rails server -b 0.0.0.0`

3. **Set Environment Variables**
   ```
   RAILS_ENV=production
   RAILS_MASTER_KEY=<value from config/master.key>
   NODE_ENV=production
   ```

4. **Database Setup**
   - Use Render's PostgreSQL add-on
   - Run migrations: `bin/rails db:migrate`

5. **Deploy**
   - Click "Deploy" on Render dashboard

### Troubleshooting Deployment

**Issue: Assets not compiling**
```bash
# Ensure build command includes webpack:
bundle install && npm install && npm run build
```

**Issue: Database connection error**
- Verify `DATABASE_URL` environment variable is set
- Run: `bin/rails db:migrate:status`

**Issue: JavaScript not loading**
- Check webpack compiled successfully: `public/packs/` should have files
- Verify `RAILS_ENV=production` is set

---

## Architecture Notes

### Key Directories

```
brasiguay/
├── app/
│   ├── models/           # 18+ models (User, Profile, Job, Estate, Event, etc.)
│   ├── controllers/      # 31 controllers for web/API
│   ├── views/            # ERB templates (admin dashboard layouts)
│   ├── javascript/packs/ # Shakapacker entry points
│   ├── channels/         # ActionCable real-time (skeleton exists)
│   └── assets/           # Legacy SCSS/images (being replaced)
├── config/
│   ├── webpack/          # Shakapacker config
│   ├── routes.rb         # RESTful routes (119 lines)
│   └── credentials.yml.enc # Encrypted secrets
├── db/
│   ├── migrate/          # Schema migrations
│   └── seeds.rb          # Sample data
└── test/                 # Minitest suite
```

### Authentication

- **Gem:** Devise 4.9
- **Routes:** Nested under `/auth/` prefix
- **Controllers:** Custom `users/registrations` and `users/sessions`

### File Uploads

- **Images:** CarrierWave 3.0+
- **Documents:** Active Storage (supported but not yet configured)

### Real-time Features

- **Gem:** ActionCable (Rails 7 native)
- **Status:** Chat system skeleton exists but not implemented
- **Future:** WebSocket chat requires UI implementation

---

## Known Issues & Future Work

### Current Limitations

1. **Chat System**
   - Skeleton exists in `app/channels/`
   - UI not implemented
   - No persistence (by design - only for online users)
   - TODO: Build chat interface using WebSockets

2. **Image Uploads**
   - CarrierWave configured but not fully tested
   - TODO: Test image upload for sales posts

3. **Ad System**
   - Infrastructure not yet built
   - TODO: Design and implement ad space

### Rails 7 Upgrade Notes

- ✅ Shakapacker replaces deprecated Webpacker
- ✅ All major dependencies compatible
- ⚠️ Some ActionText/ActiveStorage migrations partially integrated (may need review)
- ✅ Turbolinks removed (Rails 7 standard)

---

## Support & Troubleshooting

### Common Issues

**"command not found: foreman"**
```bash
bundle exec foreman start -f Procfile.dev
# Or reinstall:
bundle install
```

**"webpack-dev-server not found"**
```bash
npm install
npm run dev
```

**"database.yml error"**
- SQLite for development is auto-configured
- For PostgreSQL, update `config/database.yml` or use `DATABASE_URL`

**Port 3000 already in use**
```bash
# Use a different port:
bin/rails server -p 3001
```

### Useful Commands

```bash
# Rails console (interactive)
bin/rails console

# Check all routes
bin/rails routes

# Start fresh database
bin/rails db:reset

# Watch logs in development
tail -f log/development.log

# Rebuild Modernizr bundle (if config changed)
npm run modernizr

# Production build
npm run build
```

---

## References

- **CLAUDE.md** - Full project context and development guidelines
- **Assessment of existing code.md** - Detailed known issues by project
- **Brasiguay AGENTS.md** - Code style, testing, and commit conventions
- Rails 7.1 Docs: https://guides.rubyonrails.org
- Shakapacker Docs: https://github.com/shakacode/shakapacker

---

**Last Updated:** November 2025
**Rails Version:** 7.1.3+
**Ruby Version:** 3.3.5
