class SearchVowels

  def initialize
    @count = 0
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
    time_start Time.now
    file.each_line do |line|
      line.downcase.split("").each do |c|
        validate(c)
      end
    end
    #p @count
    print(vowels)
  end

  def validate char
    if !@vowels[char].nil?
      @vowels[char] += 1
      @count += 1
    end
    time_finish Time.now
  end

  def print vowels
    vowels.each do |k,v|
      p "#{k} => #{v}"
    end
    puts "Run in #{(@time_f.finish - @time_s.start)} seconds (around 16 years to execute)"
  end

end

print SearchVowels.new().open_file