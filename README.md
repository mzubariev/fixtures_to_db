#### Setting up project
##### Ruby 2.2.1

1. Application supports only Mysql database with two existing tables 'users' and 'posts'

2. `bundle install`

3. In `/config/database.yaml` change the database settings to yours (fields: `database`, `username`, `password`).

4. To fill database's tables with fixtures (application supports models: user, post; and formats: ini, json)
run rake task with two parameters:
  - `rake fill MODEL=user FORMAT=ini`
