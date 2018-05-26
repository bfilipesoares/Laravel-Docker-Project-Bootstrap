# Laravel-Docker-Project-Bootstrap
Bootstrap for Laravel Projects using docker and docker composer

## Quick Start

Initialize containers
```bash
docker-compose up -d
```
Set up permissions

```bash
sudo chgrp -R www-data storage bootstrap/cache
sudo chmod -R ug+rwx storage bootstrap/cache
```

Run composer install through container

```bash
docker-compose run --user www-data --rm -w /var/www app composer
```

Generate application key

```bash
docker-compose run --user www-data --rm -w /var/www app php artisan key:generate
```

Access application in

```
http://localhost:8080/
```

## Running commands

Artisan

```bash
docker-compose run --user www-data --rm -w /var/www app php artisan $COMMAND
```

Composer

```bash
docker-compose run --user www-data --rm -w /var/www app composer $COMMAND
```
