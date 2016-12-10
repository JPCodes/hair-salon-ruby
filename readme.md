# Hair Salon Administration Page

#### An app that allows the user to manage a hair salons clients and stylists, 9 Dec 2016

#### By Jim Padilla

## Description

This Ruby app has a front end interface where a user can create clients and stylists. The user can also update and delete these entries and assign clients to a stylist.

## Setup/Installation Requirements

* Clone from Github:
  * $ git clone https://github.com/JPCodes/hair-salon-ruby
  * $ cd hair-salon-ruby
  * $ bundle install

For the database functionality, use the terminal to run these commands to get the proper databases and tables installed:

```
$ postgres
$ psql
CREATE DATABASE hair_salon;
\c hair_salon;
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
```

* Run it in the browser:
  * navigate to http://localhost:4567

## Support and contact details

Github: [JPCodes](https://github.com/JPCodes)
Twitter: [jp_code2015](https://twitter.com/jp_code2015)

## Technologies Used

* Bootstrap
* Ruby
  * Sinatra
  * Rspec
  * Capybara
  * PG
* SQL
  * PSQL

### License

MIT License

Copyright (c) 2016 Jim Padilla
