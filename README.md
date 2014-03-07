# Appboy

A wrapper for the Appboy REST API using HTTParty

## Installation

Add this line to your application's Gemfile:

    gem 'appboy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install appboy

## Examples

### Initializing API

```ruby
api = Appboy::API.new('<secret>', '<app-group-id>')
```

### Track User

```ruby
api.track [{external_id: 123,
            first_name: 'John',
            last_name: 'Smith',
            gender: 'male',
            email: 'jsmith@example.com'}]
```

### Track Event
### Track Purchase
### Send Message

```ruby
message  = {android_push: {alert: 'Hello Android'},
            apple_push:   {alert: "Hello iOS"}}

user_ids = [123, 456]

api.send_message(message, user_ids)
```

### Schedule Message

```ruby
message    = {android_push: {alert: 'Hello Android'},
              apple_push:   {alert: "Hello iOS"}}
segment_id = '<segment id>'
send_at    = Time.new(2014, 3, 12)

api.schedule_message(send_at, message, segment_id)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
