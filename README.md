# README

This app is deployed at https://planafarm.herokuapp.com

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

Configure a jotform with a webhook integration to send to http://planafarm-yourname.ngrok.io/data

The form should have hidden fields with the names:

* agent_id
* supplier_id
* sector
* sub_sector
* family
* product

In the Admin area, add the jotform quick share url to a the info field of a node (eg: a section, sub_section, family or product), eg:

```json
{
  "form": "https://form.jotformeu.com/73524936903361"
}
```

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
