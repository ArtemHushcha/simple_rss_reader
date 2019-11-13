## About project

I implemented Test Task in two separated applications (BE, FE).

I put FE part in the same repository just for your convenience, to see changes in both parts.

### Back End

BE part is JSON REST API generated with
`rails new simple_rss_reader -T -d postgresql --api`

I use Interactor gem to write business logic specific code,
Feedjira gem to pars RSS feeds,
rspec_api_documentation to autogenerate docs based on real requests specs,
Rubocop to check my code and bunch of other useful gems that help me to create Rails application.

I decided to move e2e specs (Capybara part) to new for me (but awesome, please check it out) Cypress JS tool, because for my opinion if we have separated FE part it is better to test it with FE tools, also because I was curious about this relatively new test tool (as all we are about new things) of course.

### Front End

FE part is a Vue JS application generated with vue-cli
`vue init webpack simple_rss_reader_frontend`

I use tailwindcss as a CSS framework and cypress for e2e tests, see above

## Developer Setup

### Back End

BE part is just API (without frontend part) implemented on Ruby on Rails(6.0.1) application with Ruby version 2.6.5

Install all dependencies (first time it'll take awhile)

```
bundle install
```

Create test db and run specs to make sure everything is configured properly

```
rails db:setup
rails spec
```

Check the Rubocop offenses with autocorrect

```
rubocop -a
```

To generate docs (doc/index.html)

```
rake docs:generate
```

Start application

```
rails s
```

### Front End

FE part is separated Vue JS application, created and implemented without using Rails.

Install all dependencies (first time it'll take awhile)

```
cd simple_rss_reader_frontend
```

```
yarn install
```

Start application

```
yarn dev
open http://localhost:8080
```

Cypress e2e specs

https://www.cypress.io/

Please reset DB before
```
rake db:reset
```

then

```
yarn run cypress open
```
