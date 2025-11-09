# Repository Guidelines

## Project Structure & Module Organization
Brasiguay is a Rails 6.0 app on Ruby 2.6.6. Domain code stays in `app/` (controllers, models, views, ActionCable channels) with Webpacker entry points in `app/javascript/packs` and legacy SCSS/images in `app/assets`. Environment settings and routes live under `config/`, migrations and seeds in `db/`, and tests plus fixtures in `test/`. Shared POROs may go in `lib/`, and only compiled/static artifacts should be committed into `public/` or `storage/`.

## Build, Test, and Development Commands
- `bin/setup` — bootstrap gems, clean logs, and prepare the database for a new checkout.
- `bin/rails db:setup` — create, migrate, and seed the Postgres databases.
- `bin/rails server` (plus `bin/webpack-dev-server` when editing packs) — run the local stack.
- `npm run modernizr` — rebuild the vendor Modernizr bundle whenever `modernizr-config.json` changes.
- `bin/rails test` — execute the full suite or a targeted path such as `bin/rails test test/models/user_test.rb`.

## Coding Style & Naming Conventions
Use two-space indentation for Ruby, SCSS, and ERB, and keep files focused on one responsibility. Prefer Rails naming: `CamelCase` classes, `snake_case` methods, descriptive partials like `_customer_card.html.erb`, and service objects placed in `app/services` or `lib/`. JavaScript packs should use ES6 modules with one default export and mirror their snake-case filenames. No formatter is enforced, so mention any external tool (RuboCop, Prettier, etc.) you ran in the PR.

## Testing Guidelines
Minitest is authoritative; keep unit coverage in `test/models` and `test/controllers`, integration flows in `test/integration`, and UI checks in `test/system`. Name tests after the class under test (e.g., `order_test.rb`), rely on fixtures in `test/fixtures`, and add assertions for every new branch or bug fix. Always run `bin/rails test` before pushing and include the focused command you used in the PR description.

## Commit & Pull Request Guidelines
Follow the short, imperative subject style already in `git log` (`fix sidebar padding`, `add audit callbacks`). Commits should bundle code, schema dumps, and compiled packs required for that change only. Pull requests need a summary, linked issue or ticket, verification steps, and UI screenshots when relevant, plus explicit notes about migrations or new credentials.

## Security & Configuration Tips
Database credentials, pool size, and host defaults are pulled from `config/credentials.yml.enc`, so never commit plaintext `.env` or a filled `config/database.yml`. Share `config/master.key` only through the secrets manager and rotate it if compromised. Avoid committing real customer data or production dumps; scrub fixtures and sample uploads that land in `storage/`.
