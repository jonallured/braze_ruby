# BrazeRuby [![CircleCI][badge]][circle]

A wrapper for the Braze REST API. Forked from
https://github.com/DynamoMTL/appboy

## Installation

Add this line to your application's Gemfile:

    gem 'braze_ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install braze_ruby

### Configuration

Configuration settings may be passed when a new API object is instantiated:

```ruby
api_key = "instance-api-key"
braze_url = "instance-braze-url"
options = { key: "instance-options" }

api = BrazeRuby::API.new(api_key, braze_url, options)

api.api_key
# => "instance-api-key"
api.braze_url
# => "instance-braze-url"
api.options
# => {:key=>"instance-options"}
```

Alternatively, you can pass your [Braze REST API key][braze_api_key], [Braze
REST URL][braze_url], and any required [Faraday options][faraday_options] to the
`BrazeRuby::configure` method. Then, if you instantiate an API object with no
arguments it will use these global configuration settings:

```ruby
BrazeRuby.configure do |config|
  config.rest_api_key = "global-api-key"
  config.rest_url = "global-braze-url"
  config.options = { key: "global-options" }
end

api = BrazeRuby::API.new

api.api_key
# => "global-api-key"
api.braze_url
# => "global-braze-url"
api.options
# => {:key=>"global-options"}
```

#### Available `options` keys

- retry - Number of times to retry a failed request
- open_timeout - Number of seconds to wait for the connection to open
- timeout - Number of seconds to wait for the request to complete
- middlewares - Array of Faraday middleware to use

## Examples

### Initializing API

```ruby
api = BrazeRuby::API.new('<braze-rest-api-key>', '<braze-rest-url')
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

### Schedule Campaigns

```ruby
api.trigger_campaign_schedule(
  campaign_id: 'campaign-id',
  recipients: [{ external_user_id: 123 }]
  schedule: { time: Time.now.iso8601 }
)
```

### Delete Scheduled Campaign

```ruby
api.delete_campaign_trigger_schedule(
  campaign_id: 'campaign_id',
  schedule_id: 'schedule_id'
)
```

### Send Campaigns

```ruby
api.trigger_campaign_send(
  campaign_id: 'campaign-id',
  recipients: [{external_user_id: 123, trigger_properties: { first_name: 'John' }}]
)
```

### Send Canvas

```ruby
api.trigger_canvas_send(
  canvas_id: 'canvas-id',
  recipients: [external_user_id: 123, canvas_entry_properties: {first_name: 'John'}]
)
```

### Changing Email Subscription

```ruby
api.email_status(email: 'john@example.com', status: :opted_in)
```

### List Scheduled Messages and Canvases

```ruby
api.scheduled_messages(end_time: Time.now.advance(weeks: 2).iso861)
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

### Subscription groups

#### Get subscription group status for users by id
```ruby
api.subscription_user_status(external_id: [1])
```

#### Get users status for a specific subscription group
```ruby
api.subscription_status_get(
  external_id: [1],
  subscription_group_id: 'some-uuid'
)
```

#### Set user status for a specific subscription group
```ruby
api.subscription_status_set(
  external_id: [1],
  subscription_group_id: 'some-uuid',
  subscription_state: 'subscribed|unsubscribed'
)
```
#### Set user status for a specific subscription group using v2 route
```ruby
api.v2_subscription_status_set(
  subscription_groups: [
    {
      external_id: [1],
      subscription_group_id: 'some-uuid',
      subscription_state: 'subscribed|unsubscribed'
    }
  ]
)
```

### User Alias

#### Create an alias-only user

```ruby
api.create_user_aliases(
  user_aliases: [{
    user_alias: {
      alias_name: "device123",
      alias_label: "my_device_identifier",
    }
  }]
)
```

#### Identify an alias-only user
```ruby
api.identify_users(
  aliases_to_identify: [{
    external_id: 1234,
    user_alias: {
      alias_name: "device123",
      alias_label: "my_device_identifier",
    }
  }]
)
```

### External ID Migration

#### Rename users' external IDs with an array of external_id_renames
Note: you can send up to 50 rename objects per request.
```ruby
api.rename_external_ids(
  external_id_renames: [{
    current_external_id: "old_external_id",
    new_external_id: "new_external_id",
  }]
)
```

#### Remove users' old deprecated external IDs
Note: you can send up to 50 external IDs per request.
```ruby
api.remove_external_ids(external_ids: ['old_external_id'])
```

### Email Sync

#### Get List of or Query Email Unsubscribes
```ruby
api.email_unsubscribes(email: ['jdoe@example.com'])
```

#### Get List of or Query Hard Bounced Emails
```ruby
api.email_hard_bounces(email: ['jdoe@example.com'])
```

#### Remove Email Addresses From Spam List
```ruby
api.remove_emails_from_spam(email: ['jdoe@example.com'])
```

### Braze catalogs

As of november 2024, Braze catalogs still have some moving parts (beta) and only
partial support has been implemented

#### Create Catalogs
```ruby
api.create_catalogs(
  catalogs: [
    {
      name: "restaurants",
      description: "My Restaurants",
      fields: [
        {name: "id", type: "string"},
        {name: "Name", type: "string"},
        {name: "Loyalty_Program", type: "boolean"},
        {name: "Created_At", type: "time"}
      ]
    }
  ]
)
```

#### List Catalogs
```ruby
api.list_catalogs
```

#### Delete Catalog
```ruby
api.delete_catalog("restaurants")
```

#### Create Catalog Items
```ruby
api.create_catalog_items(
  "restaurants",
  items: [
    {
      id: "restaurant1",
      Name: "Restaurant1",
      Loyalty_Program: true,
      Created_At: "2022-11-01T09:03:19.967+00:00"
    }
  ]
)
```

#### Delete Catalog Items
```ruby
api.delete_catalog_items(
  "restaurants",
  items: [
    {id: "restaurant1"}
  ]
)
```

#### Update Catalog Items

This functions like an upsert, the name of the associated permission api key
permission is `catalog.replace_items`

```ruby
api.update_catalog_items(
  "restaurants",
  items: [
    {
      id: "restaurant1",
      Name: "NewRestaurantName",
      Loyalty_Program: false,
      Created_At: "2022-11-01T09:03:19.967+00:00"
    }
  ]
)
```

## Debugging

The BRAZE_RUBY_DEBUG environment variable will trigger full printouts of the
Faraday gem's HTTP requests and responses.

```bash
cd /my/app
export BRAZE_RUBY_DEBUG=true
bundle exec rails whatever
```

## Releasing

Before releasing the CHANGELOG should be updated so that the new version has
it's own section and an empty Unreleased section is ready for the next change.
New versions are released by running a script locally that bumps the minor level
of the gem and then pushes to a GitHub Action that actually sends the new
version to RubyGems.org:

```
$ ./bin/release
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
6. Update CHANGELOG

[badge]: https://circleci.com/gh/jonallured/braze_ruby.svg?style=svg
[braze_api_key]: https://www.braze.com/docs/api/api_key/
[braze_url]: https://www.braze.com/docs/api/basics/#endpoints
[circle]: https://circleci.com/gh/jonallured/braze_ruby
[faraday_options]: https://github.com/lostisland/faraday/blob/main/lib/faraday/options.rb
