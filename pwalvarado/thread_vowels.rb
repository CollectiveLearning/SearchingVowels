require 'benchmark'

class SequentialVowels

  attr_accessor :ary

  def initialize
    @ary = []
  end

  def self.run
    obj = new
    time = Benchmark.measure {
      obj.threaded_counting
      obj.merging_counting
    }
    "#\nrun in #{time.real} secs"
  end

  def parse
    open_file.each_line do |line|
      line.scan(/[aeiouAEIOU]/).each {|c| counter[c.downcase] += 1}
    end
  end

  def threaded_counting
    open_file.each_slice(40000) do | batch_lines |
      ary.push(Thread.new{ process(batch_lines) })
    end
    ary.each {|t| puts t["mycount"] }
  end

  def merging_counting
  end

  def process(batch_lines)
    counter = Hash.new(0)
    batch_lines.each do | line |
      line.scan(/[aeiouAEIOU]/).each {|c| counter[c.downcase] += 1}
    end
    Thread.current["mycount"] = counter
  end

  def app_root
    @app_root ||= File.expand_path(File.dirname(__FILE__))
  end
  private :app_root

  def open_file
    @open_file ||= File.open(File.join(app_root, "../text.txt"), "r")
  end
  private :open_file
end

puts SequentialVowels.run