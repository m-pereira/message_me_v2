[![CircleCI](https://circleci.com/gh/m-pereira/message-me.svg?style=svg)](https://circleci.com/gh/m-pereira/message-me)
[![Coverage Status](https://coveralls.io/repos/github/m-pereira/message-me/badge.svg)](https://coveralls.io/github/m-pereira/message-me)

# Message me

Hello guys! This is one more exercise from [Ruby on rails developer course](https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/),
and I made it using redis as production adapter, to show the messages in real time. Thanks!

### Instructions:

You can browse to `https://message-me-m-pereira.herokuapp.com/login`, make sign up, and write some messages! XD

or you can...

#### Run it locally:

* Clone the project:

      $ git clone git@github.com:m-pereira/message_me_v2.git

* Browse to folder:

      $ cd message-me

* Copy the database.yml file:

      $ cp config/database.yml.example config/database.yml

* For this app you will need [Postgresql](https://www.postgresql.org/) as database adapter.

* Run bundle install:

`$ bundle instal` or just `$ bundle`

* Set up the database:

      $ rails db:create && rails db:migrate

* Start the server:

      $ rails s

* And finally browse to `localhost:3000` Gotcha!
