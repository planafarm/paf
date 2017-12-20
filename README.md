# README

## Setup

```sh
rbenv install 2.4.1
bundle
bin/rails db:schema:load
bin/rails db:seed
```

Choose an ngrok endpoint name, for example you could use: planafarm-yourname. For example, dsgh uses planafarm-dsgh.

Create a `.env.local` file and fill it with:

```
HOST=planafarm-yourname
```

Configure jotform's webhook integration to send to http://planafarm-yourname.ngrok.io/data

The form should have hidden fields with the names:

* agent_id
* supplier_id
* sector
* sub_sector
* family
* product

## Run

```sh
pg_ctl -D /usr/local/var/postgres start >/dev/null 2>&1
bin/rails s
bin/webpack-dev-server
ngrok http -subdomain=planafarm-yourname 3000
```

## Code check

```sh
bin/rubocop
yarn eslint app/assets/javascripts
```

## Deploy

```sh
git push heroku master
```
