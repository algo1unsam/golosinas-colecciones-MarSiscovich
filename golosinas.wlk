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
        _peso /= 2
    } else {
        _peso *= 0.75
    }
  }  
}
object chocolatin {
  method _precio() = _pesoI / 2
  var property _sabor = "chocolate"
  var property _peso = 0
  var property _pesoI = 0
  var property _gluten = false

  method peso(valor){
    _pesoI = valor
    _peso = valor
  }

  method recibeMordisco() {
    _peso -= 2
  }
}

object golBaniada {
  method _precio() = golosinaBase._precio() + 2
  method _sabor() = golosinaBase._sabor()
  method peso() = golosinaBase._peso() + banioChocolate
  var property golosinaBase = null 
  
  method _gluten() = golosinaBase._gluten() 
  var property banioChocolate = 4

  method golosinaBase(golosina,pesoInicial){
    if (pesoInicial != null) {
            chocolatin.peso(pesoInicial) 
    }
    golosinaBase = golosina
    return golosinaBase
  }

  method recibeMordisco(){
    golosinaBase.recibeMordisco()
    if (banioChocolate > 0 ){
      banioChocolate -= 2
    }
  }
}

object tuti{
  var property _sabor = naranja
  var property _peso = 5
  var property _gluten = null

  method _precio() {
    if (_gluten){
        return 7
    }else{
        return 10
    }
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
  var property conjuntoSabores = #{}
  var property sumaPeso = 0
  var property golosinasDeseadas = [caramelo,"mentita",alfajor,"oreo"]
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
    return golosina.any({golosina => golosina._gluten()})    
  }
  method preciosCuidados(){
    golosina.map({golosina => precioCuidado.add(golosina._precio() <= 10)})
    return precioCuidado
  } 
  method golosinaDeSabor(unSabor) {
    golosina.all({golosina => golosina._sabor() == unSabor})
    return golosina.first()
  }
  method golosinasDeSabor(unSabor) {
    golosina.all({golosina => golosina._sabor() == unSabor})
  return golosina
  }
  method sabores(){
    golosina.map({golosina => conjuntoSabores.add(golosina._sabor())})
    return conjuntoSabores
  }
  method golosinaMasCara() = golosina.max({golosina => golosina._precio()})
  method pesoGolosinas() = golosina.sum({golosina => golosina._peso()})

  method golosinasFaltantes(gDeseadas) =  golosinasDeseadas.filter({ golosina => !golosina.contains(golosina)})


}
