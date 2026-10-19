# Custom ORM & Fixture Parser CLI

This is a technical assessment project that implements a command-line tool to parse data fixtures from INI and JSON files and load them into a MySQL database. 

The core constraint of this project was to avoid using the native `ActiveRecord` gem, so it features a custom-built, lightweight **ORM-like engine** modeled after `ActiveRecord::Base`.

## 🛠 Features & Architecture
* **Custom ORM:** Implements basic database mapping and operations without relying on the standard Rails ActiveRecord.
* **CLI Interface:** Built as a standalone console utility triggered via Rake tasks.
* **Format Support:** Robust parsing for both `ini` and `json` data structures.
* **Dual-Layer Testing:** Comprehensive test coverage using **RSpec** for unit testing and **Cucumber** for behavior-driven integration tests.

## 🚀 Requirements & Environment
* **Ruby version:** `2.2.1`
* **Database:** MySQL 
* **Supported Models:** `user`, `post` (requires pre-existing `users` and `posts` tables)
* **Supported Formats:** `ini`, `json`

## ⚙️ Installation & Setup

1. **Install dependencies:**
   ```bash
   bundle install
   ```

2. **Configure Database Connection:**
   Open `config/database.yaml` and update the settings with your local MySQL credentials:
   ```yaml
   database: your_database_name
   username: your_username
   password: your_password
   ```

## 📦 Usage

To parse fixtures and populate the database tables, run the `fill` Rake task with the required `MODEL` and `FORMAT` environment variables:

```bash
rake fill MODEL=user FORMAT=ini
```

## 🧪 Running Tests

The project is fully covered by automated tests. You can run them using the following commands:

* **Run Unit Tests (RSpec):**
  ```bash
  bundle exec rspec
  ```
* **Run Integration/Acceptance Tests (Cucumber):**
  ```bash
  bundle exec cucumber
  ```
