# BrazeRuby

A wrapper for the Braze REST API. Forked from https://github.com/DynamoMTL/appboy

## Installation

Add this line to your application's Gemfile:

    gem 'braze_ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install braze_ruby

## Examples

### Initializing API

```ruby
api = BrazeRuby::API.new('<braze-rest-api-key>', '<braze-rest-api-url')
```

### Track User Attributes

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

```ruby
api.track_users(events: [{
  external_id: 123,
  name: 'add-to-cart',
  time: Time.now
}])
```

##### Track Events for Single User

```ruby
api.track_event(external_id: 123, name: 'Event', ...)
```

### Track Purchase

```ruby
api.track_users(purchases: [{
  external_id: 123,
  product_id: 456,
  currency: 'CAD',
  price: 1.99,
  time: Time.now
}])
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

```ruby
api.schedule_messages(send_at: 1.hour.since, messages: messages, external_user_ids: [123, 456])
```

### Send Campaigns

```ruby
api.trigger_campaign_send(
  campaign_id: 'campaign-id',
  recipients: [external_user_id: 123, trigger_properties: {first_name: 'John'}]
)
```

### Changing Email Subscription

```ruby
api.email_status(email: 'john@example.com', status: :opted_in)
```

### List Segments

```ruby
api.list_segments
```

### Export Users

#### By IDs

```ruby
api.export_users(external_ids: [1])
```

#### By Segment

```ruby
api.export_users(segment_id: segment_id, callback_endpoint: 'https://example.com')
```
### Delete Users

#####
Delete Braze Users with an array of external_ids
```ruby
api.delete_users([1, 2, 3])
```

## Debugging

The BRAZE_RUBY_DEBUG environment variable will trigger full printouts of the Faraday gem's HTTP requests and responses.

```bash
cd /my/app
export BRAZE_RUBY_DEBUG=true
bundle exec rails whatever
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
