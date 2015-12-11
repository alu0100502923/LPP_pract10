require "pract9/version"

class Cita
    
    attr_accessor :lo
    
    def initialize
        @lo=Lista.new
    end
    
    def insertar(b)
        @lo.push(b)
        @lo = @lo.sort
    end
    
    def to_s
        s = ''
        size = @lo.length
        i=0
        while (i < size)
            s += lo[i].to_s + "\n"
            i = i+1
        end
        s
    end
end