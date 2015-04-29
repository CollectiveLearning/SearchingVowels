class Vowels

  def ejecutar
    tiempo_inicial = Time.now
    search
    tiempo_final = Time.now
    puts "Se encontraron las siguientes vocales #{@char_count}" + "en un tiempo de #{ tiempo_final - tiempo_inicial }"
  end

  def search
    File.open('text.txt','r') do |f|
      @char_count = Hash.new(0)
      f.each_char do |c|
        if c.downcase == 'a'
          @char_count[c] += 1
          
        elsif c.downcase == 'e'
          @char_count[c] += 1
          
        elsif c.downcase == 'i'
          @char_count[c] += 1
        elsif c.downcase == 'o'
          @char_count[c] += 1
        elsif c.downcase == 'u'
          @char_count[c] += 1
        end
      end
    end
  end
end
Vowels.new.ejecutar
