require "pract9/version"
require "pract9/lista"
require "pract9/pract9"

class Cita
        
	include Enumerable
	
	def initialize(x)
		@lista = Lista.new(x)
	end
	
	def insertar(x)
		@lista.push(x)
	end
	
	def valor_inicial
		n = @lista.inicio
		return n[:value]
	end
	
	def each
		@lista.each{|x| yield x}
	end
	
	def to_s
		resultado=""
		@lista.each do|x|
			resultado << x.to_s
			resultado << "\n"
		end
		return resultado
	end
end