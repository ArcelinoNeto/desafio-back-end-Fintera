# Account Registration API

Account Registration API is a Ruby on Rails backend project focused on account registration, user management and entity access relationships.

The project was initially developed from a backend technical challenge and later maintained as a portfolio case to demonstrate refactoring, automated testing, domain modeling and API design.

## Project Context

The original challenge proposed three main goals:

* Refactor a complex account creation flow
* Add automated tests to uncovered parts of the application
* Implement a new feature to support users associated with multiple entities

The main business rule evolved from a simple relationship where one account had many users, to a more flexible model where users have a unique registration and can access different entities.

## Features

* Account registration through REST API
* User registration during account creation
* Entity-based access relationship
* Refactored account creation flow
* Automated test coverage
* PostgreSQL database
* Docker support for database setup
* Code quality analysis with RuboCop
* Parallel test execution with `parallel_tests`

## API Endpoint

### Create Registration

```http
POST /api/v1/registrations
```

### Request Body

```json
{
  "account": {
    "name": "Example Account",
    "from_partner": true,
    "many_partners": true,
    "users": [
      {
        "email": "someone@example.com",
        "first_name": "Example",
        "last_name": "User",
        "phone": "62999999999"
      }
    ]
  }
}
```

### Success Response

```json
{
  "message": "Registro realizado com sucesso"
}
```

### Error Response

```json
{
  "error": "Name can't be blank"
}
```

## Registration Params

| Param         | Type             | Description                                                  |
| :------------ | :--------------- | :----------------------------------------------------------- |
| name          | string, required | Account name                                                 |
| from_partner  | boolean          | Indicates whether the account comes from a partner           |
| many_partners | boolean          | Indicates whether the account is linked to multiple partners |
| users         | array, required  | Users associated with the account registration flow          |

## User Params

| Param      | Type   | Description       |
| :--------- | :----- | :---------------- |
| email      | string | User email        |
| first_name | string | User first name   |
| last_name  | string | User last name    |
| phone      | string | User phone number |

## Business Rule Evolution

Initially, the account creation flow also created users directly linked to an account.

The new requirement introduced a more flexible structure:

* Users should have a unique registration
* Users should be related to entities
* An account can have multiple entities
* A user can access different entities

This change required improvements in data modeling, service organization, validations and automated test coverage.

## Tech Stack

* Ruby 3.0.3
* Ruby on Rails
* PostgreSQL
* Docker
* Docker Compose
* RSpec
* Parallel Tests
* SimpleCov
* RuboCop
* Foreman

## Setup

### Requirements

* Docker
* Docker Compose
* Ruby 3.0.3

Start the PostgreSQL container:

```bash
docker-compose up
```

Create the environment file:

```bash
cp .env.example .env
```

Install dependencies:

```bash
bundle install
```

Set up the database:

```bash
rails db:setup
```

Start the application:

```bash
foreman start
```

## Running Tests

Prepare the test database:

```bash
rails db:test:prepare
```

Create parallel test databases:

```bash
rails parallel:create
```

Run the test suite:

```bash
COVERAGE=true parallel_rspec spec -n 4
```

Check the coverage report:

```text
./coverage/index.html
```

## Code Quality

Run RuboCop:

```bash
rubocop --parallel
```

## Project Goals

This project demonstrates:

* Refactoring of complex business flows
* Service-oriented organization
* API design with Ruby on Rails
* Automated testing with RSpec
* Database relationship modeling
* Handling evolving business requirements
* Code quality practices with RuboCop
* Test performance optimization with parallel execution

## Portfolio Notes

Although this project started as a technical challenge, it was kept as a backend case study because it represents common real-world scenarios: refactoring legacy-like flows, improving test coverage and adapting the domain model to new business requirements.
