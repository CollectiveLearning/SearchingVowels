class Archivo
  def self.vocales
    vocales = ['a',"e","i","o","u"]
  end

  def self.abrir_archivo
    tiempo_inicial = Time.now
    archivo = File.open('/home/local/VISIONAMOS/jrios/Escritorio/Vocales/text.txt')
    self.leer_archivo(archivo, tiempo_inicial)
  end

  def self.leer_archivo(archivo, tiempo_inicial)
    texto = archivo.read
    self.leer_letras(texto, tiempo_inicial)
  end

  def self.leer_letras(texto, tiempo_inicial)
    letras = texto.split('')
    vocal = Hash.new(0)
    letras.each do |letra|
      vocal[letra] += 1 if self.vocales.include? letra.to_s
    end
    puts vocal
    puts "Tiempo de Ejecución " + self.cronometro(tiempo_inicial, Time.now).to_s
  end

  def self.cronometro(tiempo_inicial, tiempo_final)
    tiempo_final - tiempo_inicial
  end
end

Archivo.abrir_archivo