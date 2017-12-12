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
Configure jotform's "Thank you page" to point to http://planafarm-yourname.ngrok.io

## Run

```sh
pg_ctl -D /usr/local/var/postgres start >/dev/null 2>&1
bin/rails s
ngrok http -subdomain=planafarm-yourname 3000
```

## Deploy

```sh
git push heroku master
```
