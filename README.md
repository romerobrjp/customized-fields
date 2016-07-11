# ResultadosDigitais challange

## Contacts list with custom fields

This application simulates a contacts list with a login/logout system. It must allow users to create customized fields (text field, text area, combobox) that are not shared with other users.

## Getting started

- Clone this repository
- Synchronize your Ruby version to the same of the specified in the Gemfile
- Execute "bundle install" command to prepare and configure the gems
- Change the username and password values of your database in database.yml file
- If you do not use Postgres as your database you need to change the database.yml configuration to your favorite DBMS
- Create the database: "rake db:create"
- Execute the migrations: "rake db:migrate"
- Run the server: "rails s"
- Open your browser in localhost:3000

## Note
- In order to use the contacts list app, you must create an account (through "sign up" link) and sign in.
- Remember to install Postgres in your machine or another database your prefer.
