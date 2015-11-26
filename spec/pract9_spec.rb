require 'spec_helper'
require 'pract9/pract9'
require 'pract9/lista'

describe Pract9 do
  
      lib1 = Libro.new(["Dave Thomas","Andy Hunt", "Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide","(The Facets of Ruby)","Pragmatic Bookshelf;", "4 Edition", "(July 7, 2013)",["ISBN-13: 978-1937785499", "ISBN-10:1937785491"])
      lib2 = Libro.new(["Scott Chacon"],"Pro Git 2009th Edition","(Pro)"," Apress;","2009 edition","August 27, 2009",["ISBN-13: 9781430218333", "ISBN-10: 1430218339"])
      lib3 = Libro.new(["David Flanagan", "Yukihiro Matsumoto"],"The Ruby Programming Language","O’Reilly", "Media;","1 edition","February 4, 2008",["ISBN-10: 0596516177", "ISBN-13: 978-0596516178"])
      lib4 = Libro.new(["David Chelimsky", "Dave Astels", "Bryan Helmkamp", "Dan North", "Zach Dennis", "Aslak Hellesoy"],"The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends","(The Facets of Ruby)"," Pragmatic Bookshelf;"," 1 edition","December 25, 2010",["ISBN-10: 1934356379", "ISBN-13: 978-1934356371"])
      lib5 = Libro.new(["Richard E. Silverman"],"Git Pocket","Guide O’Reilly"," Media;","1 edition","August 2, 2013",["ISBN-10: 1449325866", "ISBN-13: 978-1449325862"])
          
      lista = Lista.new(lib1)
      lista.push(lib2)
    
  describe "Formatear la referencia" do
  
    it "Existe un método para obtener la referencia fotmateada" do
        expect(lib1.to_s).to eq("[\"Dave Thomas\", \"Andy Hunt\", \"Chad Fowler\"].\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide\n((The Facets of Ruby))\nPragmatic Bookshelf; 4 Edition edition ((July 7, 2013))\n[\"ISBN-13: 978-1937785499\", \"ISBN-10:1937785491\"]")
    end
  
  end
  
  describe Revista do
    
    rev = Revista.new("La revistaca",["Juan"],"Los perros","Animales","yolo","73","14 August",["1232123"])
    
    it "Es una instancia de Revista" do
      expect(rev.instance_of?Revista).to eq(true)
    end
    
    it "Pertenece a la jerarquia de clase de Pract8" do
      expect(rev.is_a?Pract9).to eq(true)
    end
    
    it "Contiene nombre de la revista" do
      expect(rev.nomRevista).to eq("La revistaca")  
    end
    
  end
  
  describe Periodico do
    
    rev = Periodico.new("El Periodicazo",["Juan"],"Los perros","Animales","yolo","73","14 August",["1232123"])
    
    it "Es una instancia de Periodico" do
      expect(rev.instance_of?Periodico).to eq(true)
    end
    
    it "Pertenece a la jerarquia de clase de Pract8" do
      expect(rev.is_a?Pract9).to eq(true)
    end
    
    it "Contiene nombre del periodico" do
      expect(rev.nomPeriodico).to eq("El Periodicazo")  
    end
    
  end
  
  describe EDoc do
    
    rev = EDoc.new("www.muchito.com",["Juan"],"Los perros","Animales","yolo","73","14 August",["1232123"])
    
    it "Es una instancia de EDoc" do
      expect(rev.instance_of?EDoc).to eq(true)
    end
    
    it "Pertenece a la jerarquia de clase de Pract8" do
      expect(rev.is_a?Pract9).to eq(true)
    end
    
    it "Contiene nombre una URL" do
      expect(rev.url).to eq("www.muchito.com")  
    end
    
  end
  
  describe Node do
    
    it "Debe existir un Nodo de la lista con sus datos, su siguiente y su anterior" do 
       expect(lista.inicio.value).to eq(lib1)
       expect(lista.inicio.next).to_not eq(nil)
       expect(lista.inicio.prev).to eq(nil)
    end
  end
  
  describe Lista do
    
    it "Se extrae el primer elemento de la lista" do
      expect(lista.pop).to eq(lib1)
      expect(lista.inicio.value).to eq(lib2)
    end
    
    it "Se puede insertar un elemento" do
      expect(lista.push(lib3)).to eq(lib3)
      expect(lista.final.value).to eq(lib3)
    end
    
    it "Se pueden insertar varios elementos" do
      lista.pushMore([lib4,lib5])
      expect(lista.final.value).to eq(lib5)
      
    end
    
    it "Debe existir una Lista con su cabeza" do
      expect(lista.inicio).to_not eq(nil)
    end
    
    it "Mostrar la Lista" do
      expect(lista.to_s).to eq("Libro 1: [\"Scott Chacon\"].\nPro Git 2009th Edition\n((Pro))\n Apress; 2009 edition edition (August 27, 2009)\n[\"ISBN-13: 9781430218333\", \"ISBN-10: 1430218339\"]\nLibro 2: [\"David Flanagan\", \"Yukihiro Matsumoto\"].\nThe Ruby Programming Language\n(O’Reilly)\nMedia; 1 edition edition (February 4, 2008)\n[\"ISBN-10: 0596516177\", \"ISBN-13: 978-0596516178\"]\nLibro 3: [\"David Chelimsky\", \"Dave Astels\", \"Bryan Helmkamp\", \"Dan North\", \"Zach Dennis\", \"Aslak Hellesoy\"].\nThe RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends\n((The Facets of Ruby))\n Pragmatic Bookshelf;  1 edition edition (December 25, 2010)\n[\"ISBN-10: 1934356379\", \"ISBN-13: 978-1934356371\"]\nLibro 4: [\"Richard E. Silverman\"].\nGit Pocket\n(Guide O’Reilly)\n Media; 1 edition edition (August 2, 2013)\n[\"ISBN-10: 1449325866\", \"ISBN-13: 978-1449325862\"]\n")
    end
    
    it "Funciona la lista doblemente enlazada" do
      expect(lista.inicio.prev).to eq(nil)
      expect(lista.final.prev).to_not eq(nil)
    end
    
  end
end
