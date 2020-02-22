//
//  DetailViewController.swift
//  tablas
//
//  Created by 2020-2 on 22/02/20.
//  Copyright © 2020 2020-2. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var item:String = ""
    @IBOutlet weak var productName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productName.text = item
    }
    @IBAction func agregar(_ sender: UIButton){
        
    }
    @IBAction func cancelar(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    
    

   

}
