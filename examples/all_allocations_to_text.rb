require "bundler/setup"
require "braze_ruby"
require "allocation_stats"

stats = AllocationStats.new

stats.trace
api = BrazeRuby::API.new("invalid", "https://sdk.iad-01.braze.com")
api.email_status
stats.stop

puts stats.allocations.to_text
