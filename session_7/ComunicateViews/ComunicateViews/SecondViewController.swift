//
//  SecondViewController.swift
//  ComunicateViews
//
//  Created by Berenice Medel on 06/03/20.
//  Copyright © 2020 Berenice Medel. All rights reserved.
//

import UIKit
protocol SecondViewControllerDelegate{
    func showData(_ name: String)
    
}

class SecondViewController: UIViewController {
    
    var delegate: SecondViewControllerDelegate?
    
    @IBOutlet weak var nameTF: UITextField!
    
    var testButton: UIButton = {
        var b = UIButton(type: .system)
        b.setTitle("haz click", for: .normal)
        b.backgroundColor = .red
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(testButton)
        
        testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveName(_ sender: UIButton){
        if let name = nameTF.text{
            delegate?.showData(name)
            dismiss(animated: true, completion: nil)
        }
    }
}
