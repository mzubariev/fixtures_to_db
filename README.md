#### Setting up project
##### Ruby 2.2.1

Application supports only Mysql database, so you need to install mysql client
if you don't have it yet.
1. sudo apt-get install libmysqlclient-dev  (for Ubuntu)
2. cd /path_to/fixtures_to_db
3. gem install bundler
4. bundle install
5. In /config/database.yaml change the database settings to yours (fields: database, username, password).
If you don't have 'posts' and 'users' tables in your database - application will make it.
If you leave database field empty - application will make own test database with test tables.
To fill database's tables with fixtures (application supports models: user, post; and formats: ini, json)
run rake task with two parameters:
6. rake fill MODEL=user FORMAT=ini