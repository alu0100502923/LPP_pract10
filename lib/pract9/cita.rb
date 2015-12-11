require "pract9/version"

class Cita
    
    attr_accessor :l, :lo
    
    def initialize
        @l=Lista.new
        @lo=Lista.new
    end
    
    def insertar(b)
        @l.push(b)
        @lo=@l.sort
    end
end