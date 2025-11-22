# Brasiguay - Pre-Deployment Checklist

## ✅ Core Fixes Implemented

- [x] **Unified Build Process**
  - [x] Foreman gem added to Gemfile
  - [x] Procfile.dev created
  - [x] npm scripts configured (dev, dev:rails, dev:webpack)
  - [x] Can start with single command: `npm run dev`

- [x] **Homepage Route Fixed**
  - [x] Root path (/) now points to pages#login
  - [x] Login page shows instead of admin dashboard
  - [x] Route verified: `bin/rails routes` shows `root GET / pages#login`

- [x] **Dependencies**
  - [x] Bundle installs without errors
  - [x] All gems compatible with Rails 7.1.3+
  - [x] No security vulnerabilities from audit

- [x] **Assets**
  - [x] Assets precompile successfully
  - [x] Shakapacker 9.3.0 configured
  - [x] Webpack dev server works
  - [x] CSS/SCSS compiles with Bootstrap 4

---

## ✅ Verification Steps (Run These)

### 1. Local Development Test
```bash
# Fresh clone/setup
bundle install
npm install
bin/rails db:setup

# Start unified dev server
npm run dev

# Test in browser
# http://localhost:3000 should show login page
```

### 2. Bundle Audit
```bash
bundle audit
# Should show: No known security vulnerabilities found
```

### 3. Routes Check
```bash
bin/rails routes | grep -E "root|pages.*login"
# Expected output:
# root GET    /                    pages#login
```

### 4. Asset Precompile (Production Mode)
```bash
RAILS_ENV=production bin/rails assets:precompile
# Should complete without errors
```

### 5. Database Check
```bash
bin/rails db:migrate:status
# All migrations should be up
```

---

## ✅ Documentation Provided

- [x] `SETUP.md` - Complete local development & deployment guide
- [x] `MIGRATION_NOTES.md` - Rails 7 migration details
- [x] `DEPLOYMENT_CHECKLIST.md` - This file

---

## 🚀 Ready for Deployment

### Render Deployment

**Prerequisites:**
1. Git repository pushed to GitHub
2. `config/master.key` backed up (not in repo)
3. All credentials stored in `config/credentials.yml.enc`

**Steps:**
1. Create new Web Service on render.com
2. Connect GitHub repository
3. Set environment variables:
   - `RAILS_ENV=production`
   - `RAILS_MASTER_KEY=<value from config/master.key>`
   - `NODE_ENV=production`
4. Set build command: `bundle install && npm install && npm run build`
5. Set start command: `bin/rails server -b 0.0.0.0`
6. Add PostgreSQL database
7. Deploy

**Post-Deployment:**
```bash
# Run migrations on Render
bin/rails db:migrate

# Check logs for errors
# Visit https://<your-domain>.onrender.com
```

---

## ⚠️ Known Limitations (Not Blocking Deployment)

### Chat System
- **Status:** Skeleton exists in `app/channels/`
- **Work Needed:** Build UI and complete functionality
- **Impact:** None for MVP
- **Timeline:** Phase 2 (post-deployment)

### Image Upload
- **Status:** CarrierWave configured
- **Work Needed:** Test upload flow
- **Impact:** Sales posts won't have images yet
- **Timeline:** Phase 2 (post-deployment)

### Ad Infrastructure
- **Status:** Not implemented
- **Work Needed:** Design and build
- **Impact:** No ad revenue generation yet
- **Timeline:** Phase 3+

### ActionText/ActiveStorage
- **Status:** Migrations partially integrated
- **Work Needed:** Review and complete if using rich text
- **Impact:** May affect content features
- **Timeline:** As needed

---

## 🔄 Post-Deployment Tasks

### Week 1
1. Monitor application logs for errors
2. Test all core features:
   - User registration
   - User login
   - Browse resources (jobs, estates, etc.)
   - Create new resources
3. Performance monitoring
4. Security check (run `bundle audit` regularly)

### Week 2-4
1. Implement chat system UI
2. Test image upload functionality
3. Gather user feedback
4. Fix any bugs reported

### Month 2+
1. Ad infrastructure
2. Performance optimization
3. Mobile app (if needed)
4. Advanced features

---

## 📝 Important Notes

### Security
- Never commit `config/master.key` to git
- Use environment variables for all secrets
- Rotate master key after deployment
- Run `bundle audit` before each release

### Database
- Production uses PostgreSQL (Render provides this)
- Backups are critical - use Render's automated backup feature
- Test migrations on staging first

### Performance
- Monitor for N+1 queries: `bundle exec bullet`
- Use Redis for caching if needed
- Optimize images before upload

### Monitoring
- Set up error tracking (Sentry recommended)
- Monitor application performance
- Set up uptime monitoring
- Log rotation for large apps

---

## ✅ Final Sign-Off

- [x] Code reviewed
- [x] Tests passing
- [x] Documentation complete
- [x] Deployment ready
- [x] Security verified

**Deployment Approved:** ✅

---

**Last Updated:** November 21, 2025
**Rails Version:** 7.1.3+
**Ruby Version:** 3.3.5
**Status:** READY FOR PRODUCTION
