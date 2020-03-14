//
//  TunesTableTableViewController.swift
//  iTunes
//
//  Created by Hernán Galileo Cabrera Garibaldi on 28/02/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit

class TunesTableTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = "Celda \(indexPath.row)"
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    overide func tableView(_ tableView: UITableView, leadingSwipeActionsCondifurationForRowAt indexPath: IndexPath -> UISwipeActionsConfiguration?){
        let actionOne = UIContextualAction(style: .normal, title: "Action 1") {
            (action, sourceView, completionHandler) in
            print("ajecutó la acción 1 ")
        }
        
        let actionTwo = UIContextualAction(style: .normal, title: "Action 2") {
            (action, sourceView, completionHandler) in
            print("ajecutó la acción 2 ")
        }
        actionOne.backgroundColor = .cyan
        actionTwo.backgroundColor = .blue
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [actionOne, actionTwo])
        return swipeConfiguration

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Seleccionw un godin", message: "Usted ha seleccionado un buen godin", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertController(title: "Cancelar",  style: .cancel, handler: nil)
        let okAction = UIAlertAction(tittle: "Ok", style: .default, handler: nil)
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        present(alertController, animated: true)

    }

}
