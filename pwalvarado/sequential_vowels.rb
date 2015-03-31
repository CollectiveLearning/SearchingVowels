require 'benchmark'

class SequentialVowels

  attr_accessor :counter

  def initialize
    @counter = Hash.new(0)
  end

  def self.run
    obj = new
    time = Benchmark.measure { obj.parse }
    "#{obj.counter} \nrun in #{time.real} secs"
  end

  def parse
    open_file.each_line do |line|
      line.scan(/[aeiouAEIOU]/).each {|c| counter[c.downcase] += 1}
    end
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
