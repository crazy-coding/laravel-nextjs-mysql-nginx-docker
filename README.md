# laravel-nextjs-mysql-nginx-docker
Starter

## Local Installation

Copy and Update `.env` from `.env.example` in Laravel

Copy and Update `.env.local` from `.env.example` in NextJS

```
docker-compose build
```
```
docker-compose up -d
```
```
docker-compose exec laravel php artisan migrate
```
Enjoy

## Docker Compose
Run service
```
docker-compose up -d
```

Stop service
```
docker-compose down
```

