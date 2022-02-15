# Virtue Rocks

Here is an api project where you can create companies and their employees and relate employees to their leadership.

## Build with
* Architecture: MVC, as a convention in RoR, and Rest API, for client-server communication with the app.
* Test: RSpec
* Database: Postgresql.
* Frameworks: Ruby on Rails 6

## For run it 

```
bundle
yarn install
rails db:setup
rails s
```

## Tests

```
rspec
```

## API
The application use four endpoints:
- `/enterprise`
- `enterprises/:enterprise_id/employees`
- `enterprises/:enterprise_id//managers`
