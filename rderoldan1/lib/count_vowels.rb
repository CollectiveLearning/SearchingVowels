class CountVowels

  def vowels
    @vowels ||= {'a' => 0, 'e' => 0, 'i' => 0, 'o'=> 0, 'u' => 0}
  end

  def file_ary
    open_file.each_line.map { |line| line }
  end

  def parse_file_parallel
    threads = []
    file_ary.each_slice(10000) do |ary|
      values = Hash.new(0)
      threads << Thread.new do
        vowels.each do |k,v|
          values[k] += ary.join.downcase.scan(k).count
        end
        Thread.current[:result] = values
      end
    end
    threads.each do |t|
      t.join
      t[:result].each {|k, v| vowels[k] += v}
    end
  end

  def parse_file_sequential
    file_ary.each do |ary|
      vowels.each do |k,v|
        vowels[k] += ary.downcase.scan(k).count
      end
    end
  end

  def open_file
    File.open(file_path)
  end

  def root_path
    File.join(File.expand_path(File.dirname(__FILE__)), '..')
  end

  def self.run_parallel
    start_time = Time.now
    count = new
    count.parse_file_parallel
    end_time = Time.now
    puts "Parallel Search"
    p count.vowels
    puts "run in #{end_time - start_time} seconds"
  end

  def self.run_sequential
    start_time = Time.now
    count = new
    count.parse_file_sequential
    end_time = Time.now
    puts "Sequential Search"
    p count.vowels
    puts "run in #{end_time - start_time} seconds"
  end

  def self.run
    run_sequential
    run_parallel
  end
end

CountVowels.run
