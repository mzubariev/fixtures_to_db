# Tech Assessment: Rails 4.1.1 & Angular 1.4.7 Integration

This repository contains a technical assessment focused on integrating a legacy Rails backend with an Angular frontend. It features a custom command-line tool designed to parse fixtures from INI and JSON files and populate a MySQL database.

## 🛠 Features & Design Constraints
* **Custom ORM:** Implements a lightweight, custom ORM-like alternative to `ActiveRecord::Base` (the native `ActiveRecord` gem is strictly omitted).
* **CLI Engine:** Data migration and parsing are triggered via dedicated Rake tasks.
* **Testing:** Fully covered with automated behavior-driven and unit tests using **Cucumber** and **RSpec**.

## 🚀 Prerequisites & Requirements
* **Ruby version:** `2.2.1`
* **Database:** MySQL (requires two existing tables: `users` and `posts`)
* **Supported Models:** `user`, `post`
* **Supported Formats:** `ini`, `json`

## ⚙️ Setting Up the Project

1. **Install dependencies:**
   ```bash
   bundle install
   ```

2. **Configure the database:**
   Open `config/database.yaml` and update the connection settings with your local MySQL credentials:
   ```yaml
   database: your_database_name
   username: your_username
   password: your_password
   ```

## 📦 Usage

To parse fixtures and fill the database tables, run the custom Rake task by specifying the target `MODEL` and `FORMAT` parameters:

```bash
rake fill MODEL=user FORMAT=ini
```

## 🧪 Running Tests

The application uses a dual-testing strategy to ensure data integrity and proper command execution.

* **To run unit tests (RSpec):**
  ```bash
  bundle exec rspec
  ```
* **To run integration/acceptance tests (Cucumber):**
  ```bash
  bundle exec cucumber
  ```
