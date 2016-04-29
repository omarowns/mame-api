# Mame API

### Ruby Version:

> 2.2.2 or greater

> 2.3.0 (recomended)

### Rails Version:

> 5.0.0.beta4

## Installation

1. Clone the project

> `git clone git@github.com:omarowns/mame-api.git`

> `cd mame-api`

2. Install dependencies

> `bundle install`

## Environment Variables

This project uses the `figaro` gem to handle `ENV` variables.
There is a `application.yml.example` already set up, just copy, rename and setup with your tokens.

> `cp config/application.yml.example config/application.yml`

Change the slack token to your actual token.

## Tests

### Setting up

> `bundle exec rake db:test:prepare`

### Running tests

> `bundle exec rake test`

## Deployment

Deploy how you see fit.

I use one of those free Heroku workers and it works perfectly.
