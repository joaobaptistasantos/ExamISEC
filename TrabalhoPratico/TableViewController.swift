//
//  TableViewController.swift
//  TrabalhoPratico
//
//  Created by Bruno Ferreira on 11/12/2018.
//  Copyright © 2018 Bruno Ferreira. All rights reserved.
//

import UIKit

protocol RefreshTableView {
    func refresh()
}

class TableViewController: UITableViewController,RefreshTableView {

    let app = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Antes o load")
        app.readFile()
        print("Apos o load")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("OLA PASSEI")
        return app.lstDisciplinas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        // Configure the cell...
        //return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemDisciplina", for: indexPath)
        
        //let section = indexPath.section
        let row = indexPath.row
        print("Passei")
        cell.textLabel?.text=app.lstDisciplinas[row].nome
        //cell.detailTextLabel?=app.lstDisciplinas[row].ano
        //cell.textLabel?.text=app.lstDisciplinas[row].semestre
        //cell.detailTextLabel?.text=app.lstDisciplinas[row].ano
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    func refresh() {
        print("No refresh")
        tableView.reloadData()
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            app.lstDisciplinas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let row_orig = fromIndexPath.row
        let row_dest = to.row
        
        let disciplina = app.lstDisciplinas.remove(at: row_orig)
        app.lstDisciplinas.insert(disciplina, at: row_dest)
        
    }
    var selected = 0
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = indexPath.row
        
        performSegue(withIdentifier: "addDisciplina", sender: tableView)
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "addDisciplina"{
            let vc = segue.destination as! ViewController
            vc.delegate = self
            if sender is UITableView{
                vc.selectedDisciplina = app.lstDisciplinas[selected]
            }
        }
    }
    

}
