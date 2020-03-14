import UIKit

// Direcciòn de variables
 //&variable

/*
 Variables calculadas
 */
//
//let timed: Bool = {
//    if val == 1{
//        return true
//    }else{
//        return false
//    }
//}()


let boton: UIButton = {
    let b = UIButton(type: .system)
    b.setTitle("Click on me", for: .normal)
    return b
}()

//Setters n& Getters

var now: String{
    get{
        return Date().description
    }
    
    set {
        print(newValue)
    }
}

print(now)
now = "Today"
print(now)

var cualquierCosa = "cualquiercosa"{
    willSet{
        print(newValue)
    }didSet{
        print(oldValue)
    }
}

print(cualquierCosa)
