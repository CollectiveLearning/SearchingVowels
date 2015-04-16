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
    @vowels   = {'a' => 0, 'e' => 0, 'i' => 0, 'o' => 0, 'u' => 0}
    @threads  = []
  end

  # Public:
  #
  # => Instance the self class and call the read_file method
  # => Instance the self class and call the read_thread_file method
  def self.run
    new.read_file
    new.read_thread_file
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

  # Public
  #
  #   => Set initial accessor with Time.now
  #   => Get the content of 'text.txt' file and loop each slice with(20000)
  #   => Acumulate in '@threads' Array a new Thread
  #   => For each ary it call the 'set_values' method to update de Hash
  #   => Wait a moment while each Thread finish
  #   => Set final accessor with Time.now
  #   => Then it call the 'print_vowels' method to print the hash
  def read_thread_file
    self.initial = Time.now
    open_file.each_slice(20000) do |ary|
      @threads << Thread.new do
        set_values(ary)
      end
    end
    @threads.each{|t| t.join}
    self.final = Time.now

    print_vowels
  end

  private
  # Private:
  #
  #   => Print the Hash @vowels
  #   => Print the difference between initial and final accessors to show how many seconds the process long
  #   => Set 0 for each key of the hash
  def print_vowels
    p @vowels
    p "Run in #{(self.final - self.initial)} Seconds"
    @vowels.each{ |k, v| k = 0 }
  end

  # Private:
  #
  #   => Do a loop of the '@vowels' keys
  #   => Validate if the value is 'String' class
  #   => Scan in the current line after convert it to downcase if the current key(vowel) was found and the class is 'String'
  #   => If the class of the value isn't string first do a 'join' and then a downcase to scan it
  #   => Accumulate in the current key the size of the Array that the scan method returned
  #
  # Parameters:
  #   => It receives the current 'String' or 'Array' of the opened file
  def set_values(value)
    @vowels.keys.each do |k|
      @vowels[k] += case value.class.to_s
        when 'String' ; value.downcase.scan(k).length
        when 'Array'  ; value.join.downcase.scan(k).length
      end
    end
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