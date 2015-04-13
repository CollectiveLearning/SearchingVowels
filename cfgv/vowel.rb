class Vowel

  attr_accessor :vowels, :initial, :final

  def initialize
    self.vowels = { 'a' => 0, 'e' => 0, 'i' => 0, 'o' => 0, 'u' => 0 }
  end

  def exec
    self.initial = Time.now
    count_repetitions
    self.final = Time.now

    p self.vowels
    p "Run in #{self.final - self.initial} Seconds"
  end

  def count_repetitions
    open_file.each_line do |row|
      row.scan(/[aeiouAEIOU]/).each { |vowel| self.vowels[vowel.downcase] += 1 }
    end
  end

  def open_file
    @open_file ||= File.open(File.dirname(__FILE__) + '/../text.txt')
  end

end

Vowel.new.exec