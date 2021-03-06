require "pract9/version"

    class Pract9
        
        include Comparable
        
           attr_reader :autor, :titulo, :serie, :editorial, :edicion, :fecha, :isbn
    
       def initialize(a,t,s,e,x,pub,i)
            @autor = a
            @titulo = t
            @serie = s
            @editorial = e
            @edicion = x
            @fecha = pub
            @isbn = i
       end
       
       def to_s
        cadena = "#{autor}.\n"
        cadena = "#{cadena}"+"#{titulo}\n"
        cadena = "#{cadena}"+"(#{serie})\n"
        cadena = "#{cadena}"+"#{editorial} #{edicion} edition (#{fecha})\n"
        cadena = "#{cadena}"+"#{isbn}"
       end
       
        def <=>(other)
			@titulo <=> other.titulo
        end
        
        
       
    end

    class Libro < Pract9
        def initialize(a,t,s,e,x,pub,i)
           super(a,t,s,e,x,pub,i)
        end
    end
    
    class Revista < Pract9
        attr_reader :nomRevista
        def initialize(nr,a,t,s,e,x,pub,i)
            
           super(a,t,s,e,x,pub,i)
           
           token1 = nr.split
            nr = ''
            i=0
            while(i<token1.length-1)
                nr ="#{nr}"+ "#{token1[i].capitalize} "
                i = i+1
            end
            nr ="#{nr}"+ "#{token1[i].capitalize}"
           @nomRevista = nr
        end
    end
    
    class Periodico < Pract9
        attr_reader :nomPeriodico
        def initialize(np,a,t,s,e,x,pub,i)
           super(a,t,s,e,x,pub,i)
           @nomPeriodico = np
        end
    end
    
    class EDoc < Pract9
        attr_reader :url
        def initialize(url,a,t,s,e,x,pub,i)
           super(a,t,s,e,x,pub,i)
           @url = url
        end
    end
    
    class ApaStyle < Pract9
        
        attr_reader :apellidos, :year
        
        def initialize(a,ap,t,s,e,x,pub,year,i)
           super(a,t,s,e,x,pub,i)
           @apellidos = ap
           @year = year
        end
        
        def <=>(other)
			if(@apellidos!=other.apellidos)
                @apellidos <=> other.apellidos
            else
                if(@year!=other.year)
                    @year<=>other.year
                else
                    @titulo<=>other.titulo
                end
            end
        end
        
        def nombre
            i = 0
            if(autor.length>1)
                while(i<autor.length-2)
                    nombre = "#{nombre}"+"#{apellidos[i]}, "+"#{autor[i][0]}., "
                    i=i+1
                end
                nombre = "#{nombre}"+"#{apellidos[i]}, "+"#{autor[i][0]}. & "
                i = i+1
            end
            nombre = "#{nombre}"+"#{apellidos[i]}, "+"#{autor[i][0]}."
        end
        
        def to_s
            cadena = nombre + "\n\t"
            cadena = "#{cadena}"+"#{titulo}\n\t"
            cadena = "#{cadena}"+"(#{serie})\n\t"
            cadena = "#{cadena}"+"#{editorial} #{edicion} edition (#{fecha}#{year})\n\t"
            cadena = "#{cadena}"+"#{isbn}"
       end
        
    end