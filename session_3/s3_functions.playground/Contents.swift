import UIKit

//Firma de la función**()**
func suma(){
    print("sumando")
}

suma()

//Firma de la función es:**(Int, Int)**
func multiplica(x: Int, y: Int){
    print(x,y)
}

multiplica(x: 3, y: 2)

func divide(_ x: Int, entre y: Int){
    print(x / y)
}
divide(8, entre: 2)


//Firma es (Int, Int) -> Int
func resta(_ x: Int, menos y: Int) -> Int{
    return x - y
}

let resultado = resta(10, menos: 2)

var contador = 0
//inout indica que viene una referencia de memoria
func incrementa(valor: inout Int){
    valor += 1
}

incrementa(valor: &contador) // pasas la referencia de contador

//Overloading
func say(_ palabra: String){
    print(palabra)
}

func say(_ palabra: Int){
    print(palabra)
}

say(3)
say("hola")

func niega() -> String{
    return "no"
}

func niega() -> Int{
    return 0
}


//let valorNegado = niega() //este genera un error puesto que lo que importa es la sobrecarga en lo que la funciòn recibe


//Parámetros por default

func creaTarjeta(nombre: String, saldo: Double = 0.0){
    print("Creando tarjeta para: \(nombre) con saldo de \(saldo)")
}

creaTarjeta(nombre: "German")

//Funcines con muchos parámetros

func imprimeCadenas(_ cadenas: String ...){
    for cadena in cadenas{
        print(cadena)
    }
}


imprimeCadenas("Hola", "cómo", "estás")

// Funciones como parámetros

func ejecuta(a: Int, b: Int, function: (Int, Int) -> Int) -> Int{
    let resultado = function(a, b)
    return resultado
}

let resultadoFinal = ejecuta(a:8, b: 10, function: resta)

//Closures: pedazos de códigp que son una funciòn pero son anónimos--
//una forma de describir si una funcion es un closure
//es con la palabra in
let miClosure = { (number: Int) -> Int in
    let resultado = number * number
    return resultado
}

var listaNumeros = [2, 3, 4, 5, 6, 7]

var numerosMapeados = listaNumeros.map(miClosure) //listaNumeros no se modifica


numerosMapeados = listaNumeros.map({(number: Int) -> Int in
    let resultado = number * number
    return resultado
})

numerosMapeados = listaNumeros.map({number in number * number})
numerosMapeados = listaNumeros.map{number in number * number}
numerosMapeados = listaNumeros.map{$0 * $0}
