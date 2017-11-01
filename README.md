# Panel Providers Devtest


## Description

This is sample application implementing devtest described [here](https://github.com/pbc/devtest/blob/master/README.md).

## Instalation

- Clone this repo `git clone https://github.com/jpietrzyk/panel-providers-devtest.git`,
- Run `bundle` to install all required gems 
- Create database with`bundle exec rake db:create`
- Run migrations with `bundke exec rake db:migrate`
- Add example data with `bundle exec rake db:seed`

## Todo
- [ ] Integration with Swagger
- [ ] Add CI service
- [ ] More documentation for endpoints and entities
- [ ] Add some OAuth2 providers and interface for creating account
- [ ] Add own OAuth2 provider
- [ ] Create sample client app
