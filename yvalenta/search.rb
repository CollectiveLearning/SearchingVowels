class SearchVowels

  def initialize
    vowels
    timer
  end

  def open_file
    f = File.open("../text.txt", "r")
    run(f)
    f.close
  end

  private

  def vowels
    @vowels ||= { 'a' => 0, 'e' => 0, 'i' => 0, 'o' => 0, 'u' => 0 }
  end

  def timer
    @time ||= {start: 0, finish: 0}
  end

  def run file
    res = Hash.new(0)
    @time[:start] = Time.now
    file.each_line do |line|
      vowels.each do |k,v|
        res[k] += line.scan(k).count
      end
    end
    @time[:finish] = Time.now
    print(res)
  end

  def print response
    puts "#{response} \nRun in #{(@time[:finish] - @time[:start])} seconds."
  end

end

SearchVowels.new().open_file