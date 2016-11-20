# Testify

A strongly opinionated framework for simplifying e2e testing of Rails applications.

It allows you to define Test Cases that can be executed from external e2e framework.

## Instalation & configuration

Add the gem into gemfile into test (and possibly development) group:

```ruby
group :development, :test do
  gem 'testify_rails'
end
```

You then need to mount the testify engine into your application.
Put the followinglines into `routes.rb`:

```ruby
  if Rails.env.development? || Rails.env.test?
    p 'Mounting testify'
    mount Testify::Engine => '/testify'
  end
```

## Defining test cases

Test cases are being loaded from `/testify` folder.

```ruby

class MyCase < Testify::Case

  #Database will be cleared before start of each test case!
  def start
    #You can use FactoryGirl in the test cases
    user = create(:user)
    return {
      foo: 'you can return json data to client from any method/statement',
      user: user
    }
  end

  #This is a statement. There can be multiple statements in a case
  # and can be called multiple times.
  def ensure_user_is_present
    count = User.count
    if count== 0
        #You can make case fail by rising errors in the test cases/statements
        raise StandartError.new
    end
    return {user_count: count}
  end

  def end
    #You can perform cleanup or final server-side checks here
  end

end

```

## Usage

After mounting the engine, the following endpoints becomes available.

For calling a case you've defined, substitute the `(:case_id)` in the following routes with the class name of your test case.

### Start test Cases

```
 POST /testify/cases/(:case_id)
```

Databse will be cleared and then `start` method will be called on the given test case.
Returns `200 OK` if no error was raised during execution.

### End test Cases

```
 DELETE /testify/cases/(:case_id)
```
Ends the given case and calls `end` method.  Returns `200 OK` if no error was raised during execution.

### Execute statement within test case

```
 DELETE /testify/cases/(:case_id)/statements/(:statement_method_name)
```

Executes statement with given method name. Returns `200 OK` if no error was raised during statement execution.


### Check whether the server is up and running

```
 GET /testify/check
```
 Returns `200 OK` if server is up and running.

