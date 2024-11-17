class ObjectTracker
  def initialize(pattern)
    @pattern = pattern
    @counts = {}
  end

  def print_and_record(stats)
    stats.allocations.all.each do |allocation|
      klass = allocation.object.class.to_s
      next unless klass.match?(@pattern)

      puts klass
      @counts[klass] = (@counts[klass] || 0) + 1
    end
  end

  def total_count
    @counts.values.sum
  end
end
