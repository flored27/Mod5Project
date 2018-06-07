<h1 align=center>Property Assistant 2018</h1>
<h1 align=center><img src="/src/images/logo.png" alt="Property Assistant 2018 logo" /></h1>

Property Assistant 2018 is a property management app that allows landlords to keep track of their assets and communicate with tenants. This repository shows the back-end files for the web app.

Property Assistant 2018 back-end is built with Ruby on Rails and PostgreSQL instead of the default SQLite. The reason for this change is because the API is deployed on [Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails5).

The relational database includes landlords (users), properties, apartments, and tenants. Tenants belong to apartments, which in turn belong to properties, and then belong to landlords. Deleting one property also deletes all of the respective apartments and tenants.

Landlords can send emails to their tenants using the [SendGrid](https://sendgrid.com/) service with Rails' built-in ActionMailer.

The front-end of this repository can be found [here](https://github.com/flored27/Property-Assistant-2018)<br/>
The demo for this repository can be found [here](https://property-assistant-2018.herokuapp.com/)<br/>
To use, just register with an email and password, and you will be logged in right after. Other fields, including phone number, first name, and last name, can be left blank.

## Features:
* user register/login/sign out
* does not allow users to register twice with the same email
* organizes properties with apartments & tenants
* can create/edit/delete properties, apartments & tenants
* allows users to send emails to tenants through back-end

## Front-end built with:
* Javascript
* Material UI
* CSS3
* HTML5
* Reactjs
* Redux

## Back-end built with:
* Ruby on Rails
* PostgreSQL
* ActionMailer
* SendGrid
* Heroku
