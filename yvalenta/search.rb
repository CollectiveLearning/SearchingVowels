class SearchVowels

  def initialize
    vowels
  end

  def open_file
    f = File.open("../text.txt", "r")
    run(f)
    f.close
  end

  def time_start(start)
    struct = Struct.new(:start)
    @time_s = struct.new(start)
  end

  def time_finish(finish)
    struct = Struct.new(:finish)
    @time_f = struct.new(finish)
  end

  private

  def vowels
    @vowels ||= { 'a' => 0, 'e' => 0, 'i' => 0, 'o' => 0, 'u' => 0 }
  end

  def run file
    res = Hash.new(0)
    time_start Time.now
    file.each_line do |line|
      vowels.each do |k,v|
        res[k] += line.scan(k).count
      end
    end
    time_finish Time.now
    print(res)
  end

  def print response
    puts "#{response} \nRun in #{(@time_f.finish - @time_s.start)} seconds."
  end

end

SearchVowels.new().open_file
