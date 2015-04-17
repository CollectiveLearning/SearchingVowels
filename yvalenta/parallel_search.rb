class SearchVowels
  def initialize
    @time ||= { start: 0, finish: 0 }
  end

  def open_file
    f = File.open("../text.txt", "r")
    run(f)
    f.close
  end

  private

  def vowels
    @vowels ||= { "a" => 0, "e" => 0, "i" => 0, "o" => 0, "u" => 0 }
  end

  def run(file)
    threads = []
    @time[:start] = Time.now
    file.each_slice(10000) do |slice|
      threads << Thread.new do
        hash_values = Hash.new(0)
        slice.join.downcase.scan(/[aeiou]/).each do |vowel|
          hash_values[vowel] += 1
        end
        Thread.current[:result] = hash_values
      end
    end
    @time[:finish] = Time.now
    threads.each do |t|
      t.join
      t[:result].each do |k, v|
        vowels[k] += v
      end
    end
    print(vowels)
  end

  def print(response)
    puts "#{response} \nRun in #{(@time[:finish] - @time[:start])} seconds."
  end
end

SearchVowels.new.open_file

