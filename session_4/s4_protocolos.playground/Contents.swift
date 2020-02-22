import UIKit

//protocolos

/*Cuando tenemos una funciòn  sin implementación, decimos que la estamos enumerando*/
protocol Volador{
    func volar() //función sin implementación
}


struct Ave: Volador{
    func volar(){
        print("volar")
    }
}

class Humano: Volador{
    func volar() {
        print("Humano volador")
    }
}

struct Perro{
    
}

func hazloVolar(_ filtro: Volador){
    filtro.volar()
    
}

let cotorro = Ave()
let cesar = Humano()
let firulais = Perro()

hazloVolar(cotorro)
hazloVolar(cesar)


/*hazloVolar(firulais) // solo van a volar aquellos que cumplan con el protocolo Volador
Asi entonces Volador se vuelve un tipo de dato
 
 Aunque firulais supiera volar, al no implementar el protocolo Volador, no pódrá volar
 por eso la función hazloVolar es como un filtro para aquellos que implementen el protocolo
 Volador
 */


