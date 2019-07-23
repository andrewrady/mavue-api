# README

Rails 5 api application for testing web applications for Martial Arts Studios.

Things you may want to cover:

* Ruby version - 2.4.2

* Configuration - tba

## Database creation 
Running this project locally you will need to have install postgres on your computer. The `database.yml` container the basic configuration that grabs some env variable.
 - User name `POSTGRES_USER`
 - Password `POSTGRES_PASSWORD`
 - Host `POSTGRES_HOST`
 - Database `POSTGRES_DATABASE`
 - Test Database `POSTGRES_TEST_DB`

## Deployment instructions 
Deployments are handle with integration on herkou and the master branch on github. Push your code to master with trigger a deployment 

## Request JWT 
To access private content you will need to get an active jwt. To get one you will need to make a `post` request to `/user_token` with an object formatted like,

```
{
  'auth': {
    'email': test@gmail.com,
    'password': password
  }
}
```