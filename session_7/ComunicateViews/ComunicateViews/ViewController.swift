//
//  ViewController.swift
//  ComunicateViews
//
//  Created by Berenice Medel on 06/03/20.
//  Copyright © 2020 Berenice Medel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate{
    func showData(_ name: String) {
        print(name)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction  func toSecondView(_ sedner: UIButton){
        let secondView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondViewController") as? SecondViewController
        secondView?.delegate = self
        present(secondView!, animated: true)
    }
    
    
}

