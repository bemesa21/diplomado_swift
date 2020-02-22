//
//  ViewController.swift
//  tablas
//
//  Created by 2020-2 on 22/02/20.
//  Copyright © 2020 2020-2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    /*metodos escritos en objective c, son opcionales dentro de swift
     UITableViewDelegate es un método creado en objective C
     */
    
    var nombres: [String] = ["bere", "Jorge", "Julia", "Luis", "Pedro"]
    var carrito: [String] = []
    @IBOutlet weak var carritoLabel: UILabel!
    @IBOutlet weak var tablita: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nombres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        cell.textLabel?.text = nombres[indexPath.row]
        if indexPath.row % 2 == 0{
            cell.backgroundColor = .purple
        }else{
            cell.backgroundColor = .magenta

        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        print(indexPath.row)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailView = segue.destination as! DetailViewController //casteando vista genérica
        let myIndexPath = tablita.indexPathForSelectedRow
        detailView.item = nombres[myIndexPath!.row]
        detailView.vc = self
        
    }
    
    func refresh(){
        carritoLabel.text = "\(carrito.count)"
    }


}

