# Sendable

Ruby bindings for sending email via the Sendable REST API.

[sendable.io](https://sendable.io)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sendable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sendable

## Configuration

```ruby
Sendable.config do |config|
  config.project_id = 'YOUR PROJECT ID'
  config.api_key = 'YOUR API KEY'
end
```

## Usage

### Render

Returns the rendered HTML for your template.

#### render arguments
- **template_id** - *string* - Template ID being sent
- **:params** - *hash* - Any email data attributes that will be available as `mustache` variables

```ruby
html = Sendable.client.render(1, {
  name: 'John Doe',
  email: 'john@doe.com',
  age: 28
})
```

### Email

Sends the email using your configured SMTP mailer in Sendable.

#### render arguments
- **template_id** - *string* - Template ID being sent
- **:params** - *hash* - Any email data attributes that will be available as `mustache` variables

```ruby
html = Sendable.client.email(1, {
  name: 'John Doe',
  email: 'john@doe.com',
  age: 28
})
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

