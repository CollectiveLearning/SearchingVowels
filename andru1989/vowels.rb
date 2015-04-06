class Vowels

  # Accessors to calculate how many seconds the process long
  attr_accessor :initial, :final

  # Public:
  #   => Initialize global variables
  #
  # Parameters:
  #   => This method set a Hash to accumulate the number of vowels for each line
  #   => Default: {'a' => 0, 'e' => 0, 'i' => 0, 'o' => 0, 'u' => 0}
  def initialize
    @vowels = {'a' => 0, 'e' => 0, 'i' => 0, 'o' => 0, 'u' => 0}
  end

  # Public:
  #
  # => Instance the self class and call the read_file method
  def self.run
    new.read_file
  end

  # Public:
  #
  #   => Set initial accessor with Time.now
  #   => Get the content of 'text.txt' file and loop each line
  #   => For each line it call the 'set_values' method to update de Hash
  #   => Set final accessor with Time.now
  #   => Then it call the 'print_vowels' method to print the hash
  def read_file
    self.initial = Time.now
    open_file.each_line do |line|
      set_values(line)
    end
    self.final = Time.now

    print_vowels
  end

  private
  # Private:
  #
  #   => Print the Hash @vowels
  #   => Print the difference between initial and final accessors to show how many seconds the process long
  def print_vowels
    p @vowels
    p "Run in #{(self.final - self.initial)} Seconds"
  end

  # Private:
  #
  #   => Do a loop of the '@vowels' keys
  #   => Scan in the current line if the current key(vowel) was found
  #   => Accumulate in the current key the size of the Array that the scan method returned
  #
  # Parameters:
  #   => It receives the current line of the opened file
  def set_values(line)
    @vowels.keys.each{|k| @vowels[k] += line.scan(/["#{k}#{k.upcase}"]/).length}
  end

  # Private:
  #
  #   => Return an absolute path and load the name of the current script
  #   => Return the whole content of the 'text.txt' file
  def open_file
    File.open(File.dirname(__FILE__) + '/../text.txt')
  end

end

# Execute the Vowels class to run the program
Vowels.run