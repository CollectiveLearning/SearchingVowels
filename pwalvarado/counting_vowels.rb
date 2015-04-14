require "benchmark"
class SequentialVowels
  def self.run
    sequential = new
    time = Benchmark.measure { sequential.sequential_parse }
    print "Sequential counting
    #{sequential.vowels}
    run in #{time.real} secs"

    threaded = new
    time = Benchmark.measure { threaded.threading_parse }
    "\n\nParallel counting
    #{threaded.vowels}
    run in #{time.real} secs"
  end

  def vowels
    @vowels ||= { "a" => 0, "e" => 0, "i" => 0, "o" => 0, "u" => 0 }
  end

  def sequential_parse
    open_file.each_slice(4000) do |batch_lines|
      line = batch_lines.join.downcase
      vowels.each { |k, _v| vowels[k] += line.scan(k).count }
    end
  end

  def threading_parse
    ary = []
    open_file.each_slice(4000) do |batch_lines|
      ary.push(Thread.new do
        sum = Hash.new(0)
        line = batch_lines.join.downcase
        vowels.each do |k, _v|
          sum[k] = line.scan(k).count
        end
        Thread.current[:result] = sum
      end)
    end

    ary.each do |thr|
      thr.join
      thr[:result].each { |k, v| vowels[k] += v }
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
