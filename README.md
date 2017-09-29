# Sendable

Ruby library for sending email via the Sendable REST API.

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
- **params** - *hash* - Object containing the following keys
  - **assigns** - *hash* - Any email data attributes that will be available as `mustache` variables

```ruby
result = Sendable.client.render(1, {
  assigns: {
    first_name: 'John',
    age: 28
  }
})
```

#### render response
```ruby
{
  success: true,
  email: {
    html: "<html><head></head><body><h1>Sample HTML</h1></body></html>",
    plain: "Sample Plain Text",
    subject: "Sample Subject",
    preheader: "Sample Preheader"
  }
}
```

### Email

Sends the email using your configured SMTP mailer in Sendable.

#### email arguments
- **template_id** - *string* - Template ID being sent
- **params** - *hash* - Object containing the following keys
  - **to** - *string* - This is the recipient's email address
  - **from** - *string* - This is the sender's email address
  - **assigns** - *hash* - Any email data attributes that will be available as `mustache` variables

```ruby
result = Sendable.client.email(1, {
  to: 'john@doe.com',
  from: 'me@awesomesite.com',
  assigns: {
    first_name: 'John',
    age: 28
  }
})
```

#### email response
```ruby
{
  success: true,
  email: {
    html: "<html><head></head><body><h1>Sample HTML</h1></body></html>",
    plain: "Sample Plain Text",
    subject: "Sample Subject",
    preheader: "Sample Preheader"
  },
  delivery: {}
}
```

The `delivery` key will include the response from your ESP.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

