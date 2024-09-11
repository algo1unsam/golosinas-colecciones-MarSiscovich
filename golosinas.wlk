object bombon {
  var property _precio = 5
  var property _sabor = "frutilla"
  var property _peso = 15
  var property _gluten = false 

  method recibeMordisco() {
     _peso =_peso * 0.8 + 1
  }



}

object alfajor {
  var property _precio = 12
  var property _sabor = "chocolate"
  var property _peso = 300
  var property _gluten = false

  method recibeMordisco() {
     _peso =_peso * 0.8
  }
}
object caramelo {
  var property _precio = 1
  var property _sabor = "frutilla"
  var property _peso = 5
  var property _gluten = true 

  method recibeMordisco() {
    _peso -= 1
  }
}
object chupetin {
  var property _precio = 2
  var property _sabor = "naranja"
  var property _peso = 7
  var property _gluten = true 

  method recibeMordisco() {
    if (_peso > 2){
        _peso = _peso * 0.90
    } 
  }
}
object oblea {
  var property _precio = 5
  var property _sabor = "vainilla"
  var property _peso = 250
  var property _gluten = false

  method recibeMordisco() {
    if (_peso > 70){
        _peso = _peso / 2
    } else {
        _peso = _peso * 0.75
    }
  }  
}
object chocolatin {
  var property _precio = _pesoI / 2
  var property _sabor = "chocolate"
  var property _peso = 0
  var property _pesoI = 0
  var property _gluten = false

  method peso(valor){
    _pesoI = valor
    _peso = valor
  }

  method recibeMordisco() {
    _peso -= - 2
  }
}

object golBaniada {
  method _precio() = golosinaBase._precio() + 2
  method _sabor() = golosinaBase._sabor()
  method _peso() = golosinaBase._peso() + 4
  method _gluten() = golosinaBase._gluten() 
  var property golosinaBase = null
  var property banioChocolate = 4

  method golosinaBase(golosina){
    golosinaBase = golosina
  }

  method recibeMordisco(){
    golosinaBase.recibeMordisco()
    if (banioChocolate == 4){
      self._peso() - 2 
      banioChocolate = 2
    } else if (banioChocolate == 2){
        self._peso() - 2 
        banioChocolate = 0
    }
  }
}

object tuti{
  var property _precio = 0 
  var property _gluten = null
  var property _sabor = naranja
  var property _peso = 5

  method precio() {
    if (_gluten == 1){
        _precio = 7
    }else if (_gluten == 0){
        _precio = 10
    }
  }
  method gluten(valor){
    _gluten = valor 
    }

  method recibeMordisco() {
    _sabor = _sabor.siguiente() 
}
}

object naranja {
  method siguiente() = frutilla
}

object frutilla {
    method siguiente() = chocolate

}object chocolate {
    method siguiente() = naranja
}


object mariano {
  var property golosina = []
  var property precioCuidado = [] 
  method comprar(unaGolosina){
    golosina.add(unaGolosina) 
  }
  method desechar(unaGolosina) {
    if (!golosina.isEmpty()){
        golosina.remove(unaGolosina)
    }
  }
  method probar() {
    golosina.forEach({golosina => golosina.recibeMordisco()})
  }

  method sinTACC() {
    golosina.any({golosina => golosina._gluten()})    
  }
  method preciosCuidados(){
    golosina.all({golosina => golosina._precio() <= 10})
    return precioCuidado.add(golosina)
  } 
}