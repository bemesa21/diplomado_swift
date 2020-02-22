import UIKit

// Optionals

var nombre: String?


if let nombreBackup = nombre {
    print("El nombre es: \(nombreBackup)")
}else{
    print("No hay nombre")
    
}

//: Nil Coalescente
let nombreRespaldo = nombre ?? "don Nadie"

//
func saluda(cadena: String?){
    guard let temp = cadena else{
        print("No hay valor")
        return
    }
    print(temp)
}
