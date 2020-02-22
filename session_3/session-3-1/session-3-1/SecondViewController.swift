//
//  SecondViewController.swift
//  session-3-1
//
//  Created by Berenice Medel on 21/02/20.
//  Copyright © 2020 Berenice Medel. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var deposito: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .purple
        print(deposito)
    }
    
    @IBAction func cerrar(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
        //dismiss(animated: true, completion: nil)
        
    }
    
    


}
