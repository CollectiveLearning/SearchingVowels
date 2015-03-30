class CountVowels

  def vowels
    @vowels ||= {'a' => 0, 'e' => 0, 'i' => 0, 'o'=> 0, 'u' => 0}
  end

  def file_ary
    open_file.each_line.map { |line| line }
  end

  def parse_file_sequential
    arr = []
    file_ary.each_slice(1000) do |sub_ary|
    arr << Thread.new do
        Thread.current['vowel'] = {'a' => 0, 'e' => 0, 'i' => 0, 'o'=> 0, 'u' => 0}
        vowels.each do |k,v|
          Thread.current['vowel'][k] += sub_ary.join.scan(k).count
        end
      end
    end
    arr.each {|t| t.join; t['vowel'].each{|k,v| vowels[k] += v}}
  end

  def parse_file_parallel
    file_ary.each do |ary|
      vowels.each do |k,v|
        vowels[k] += ary.scan(k).count
      end
    end
  end

  def open_file
    File.open(file_path)
  end

  def file_path
    File.join(File.expand_path(File.dirname(__FILE__)), '..', 'support', 'text.txt')
  end

  def self.run_parallel
    start_time = Time.now
    count = new
    count.parse_file_parallel
    end_time = Time.now
    p count.vowels
    p "run in #{end_time - start_time} seconds"
  end

  def self.run_sequential
    start_time = Time.now
    count = new
    count.parse_file_sequential
    end_time = Time.now
    p count.vowels
    p "run in #{end_time - start_time} seconds"
  end

  def self.run
    run_sequential
    run_parallel
  end
end

CountVowels.run
