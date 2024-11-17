require "bundler/setup"
require "braze_ruby"
require "allocation_stats"

require_relative "object_tracker"

tracker = ObjectTracker.new("BrazeRuby")
stats = AllocationStats.new

stats.trace
api = BrazeRuby::API.new("invalid", "https://sdk.iad-01.braze.com")
api.email_status
stats.stop

tracker.print_and_record(stats)
puts tracker.total_count
