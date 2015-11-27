require "pract9/version"

    Node = Struct.new(:value, :next, :prev)


    class Lista
        
        include Enumerable
        
        attr_accessor :inicio, :final, :prev
        
        def initialize(libro)
            @inicio = Node.new(libro, nil, nil)
            @final = @inicio
            
        end
        
        def push(libro)
            @final.next = Node.new(libro, nil, @final)
            @final = @final.next
            @final.value
        end
        
        def pushMore(libros)
		    libros.each do |libro|
			    push(libro)
            end
	end
        
        def pop
            aux = @inicio
            @inicio = @inicio.next
            @inicio.prev = nil
            aux.next = nil
            aux.value
        end
        
        def to_s
		    aux = @inicio
		    s = ''
		    i = 1
		    while (aux != nil) do
			    s += "Libro #{i}: #{aux.value.to_s}\n"
			    aux = aux.next
			    i += 1
		    end
		    s
        end
        
        def each
		    aux = @inicio
		    while (aux != nil) do
			    yield aux.value
			    aux = aux.next
		    end
	end	
        
    end