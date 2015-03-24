# Appboy

A wrapper for the Appboy REST API.

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
api = Appboy::API.new('<app-group-id>')
```

### Track User Attributes

See: [User Attributes Object Specification](https://documentation.appboy.com/REST_APIs/User_Data#user-attribute-object)

```ruby
api.track_users(attributes: [{
  external_id: 123,
  first_name: 'John',
  last_name: 'Smith',
  gender: 'male',
  email: 'jsmith@example.com'
}])
```

##### Track Attributes for Single User

```ruby
api.track_attribute(external_id: 123, first_name: 'John', ...)
```

### Track Event

See: [Event Object Specification](https://documentation.appboy.com/REST_APIs/User_Data#event-object)

```ruby
api.track_users(events: [{
  external_id: 123,
  name: 'add-to-cart',
  time: Time.now
}]
```

##### Track Events for Single User

```ruby
api.track_event(external_id: 123, name: 'Event', ...)
```

### Track Purchase

See: [Purchase Object Specfication](https://documentation.appboy.com/REST_APIs/User_Data#purchase-object)

```ruby
api.track_users(purchases: [{
  external_id: 123,
  product_id: 456,
  currency: 'CAD',
  price: 1.99,
  time: Time.now
}]
```

##### Track Purchases for Single User

```ruby
api.track_purchase(external_id: 123, product_id: 456, ...)
```

### Track Everything for Everyone All at Once

```ruby
api.track_users(purchases: purchases, events: events, attributes: attributes)
```

### Send Message

See: [Platform Push Object Specifications](https://documentation.appboy.com/REST_APIs/Messaging#platform-push-object)

##### Messages Payload

```ruby
messages = {
  android_push: { alert: 'Hello Android' },
  apple_push:   { alert: "Hello iOS" }
}
```

##### Option A, Using External User IDs

```ruby
api.send_messages(messages: messages, external_user_ids: [123, 456])
```

##### Option B, Using Segment ID

```ruby
api.send_messages(messages: messages, segment_id: '<segment-id>')
```


### Schedule Message

See: [Platform Push Object Specifications](https://documentation.appboy.com/REST_APIs/Messaging#platform-push-object)

```ruby
api.schedule_messages(send_at: 1.hour.since, messages: messages, segment_id: '<segment-id>')
```

### Changing Email Subscription

See: [Changing Email Subscription Status](https://documentation.appboy.com/REST_APIs/Email_Sync#post)

```ruby
api.email_status(email: 'john@example.com', status: :opted_in)
```

### List Segments

See: [Segment Export](https://documentation.appboy.com/REST_APIs/Export)

```ruby
api.list_segments
```

### Export Users

See: [User Export](https://documentation.appboy.com/REST_APIs/Export#user-export)

#### By IDs

```ruby
api.export_users(external_ids: [1])
```

#### By Segment

```ruby
api.export_users(segment_id: segment_id, callback_endpoint: 'https://example.com')
```



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
