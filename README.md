# Dockered WordPress setup with Nginx and Redis

This is what I use for developing standard WordPress sites. It can also be used for hosting the site, but I recommend using a proper host.
Configured to use SSL in all environments.

## Setup
First, create an `.env` to the project root, using `.env_sample` as base.

Read on.

`wordpress/` Bedrock style WordPress installation, managed by Composer.

Create an `.env` file using `.env_sample` as base.

Run `composer install` in the directory, and make changes to the config as you see fit in `config/` directory. Most is configured with .env later on.

`letsencrypt/` Scripts for certificates.

Run `./letsencrypt/letsencrypt/letsencrypt-init.sh yourdomain.com` *BEFORE* running `docker-compose up` for the first time. Follow the script.
If you're running locally, you might want to run `./letsencrypt/letsencrypt/self-signed-init.sh yourdomain.com`.

If you ignore the above advice, Nginx will not start.

`nginx/` Contains nginx configuration. Duh.

Create `.conf` and `.inc` files from the `template.*` files using envsubst, sed, or any other text editor. Replace `${SITE_URL}` with your domain, without `www`.


Next, create entries to your computers hosts file.

```
127.0.0.1 yoursite.com
```

When everything is configured, run `docker-compose up`.

## How to run wp-cli?
`docker-compose exec wordpress bash`, `cd wordpress`, and run any command you want.

## Multisite
Should work out of the box. Use Mercator if you need to have different domains, and follow the official guide: https://wordpress.org/support/article/create-a-network/

## Licence
MIT
