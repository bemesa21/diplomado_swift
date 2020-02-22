//
//  ViewController.swift
//  session-3-1
//
//  Created by Berenice Medel on 21/02/20.
//  Copyright © 2020 Berenice Medel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        //performSegue(withIdentifier: "toLogin", sender: self)
    }
    
    @IBAction func login(_ sender: UIButton){
        let loginView = ThirdViewController()
        //present(loginView, animated: true, completion: nil)
        navigationController?.pushViewController(loginView, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondView = segue.destination as! SecondViewController
        secondView.deposito = "ten esto"
    }


}

