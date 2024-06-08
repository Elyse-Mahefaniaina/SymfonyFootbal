
# Dependencies
- postgreSQL version: 15.2
- php version: 8.2
- symfony version: 7

# Installation
## Installing dependencies
```bash
composer require symfony/orm-pack
composer require --dev symfony/maker-bundle
composer require knplabs/knp-paginator-bundle
```
## Importing data
- Importing the database into /sql/data.sql
``` bash
    psql -U [user] -d [dbName] -f [file location]
``` 
- change database configuration in .env
```php
DATABASE_URL="postgresql://[username]:[password]@127.0.0.1:5432/[database]?serverVersion=15.2&charset=utf8"
```

# execution
```bash
symfony serve 
```
- running on localhost: localhost:8000