//
//  AllListViewControllerTableViewController.swift
//  Checklists
//
//  Created by iem on 09/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import UIKit

class AllListViewController: UITableViewController {
    
    //var list = [Checklist]()
    var singleton = DataModel.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.singleton.sortChecklists()
        self.tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        //self.list.append(Checklist(txt: "List1", item: [ChecklistItem(txt: "hello"),ChecklistItem(txt: "hella"),ChecklistItem(txt: "hollo")]))
        //self.list.append(Checklist(txt: "List2", item: [ChecklistItem(txt: "swifty"),ChecklistItem(txt: "swifta"),ChecklistItem(txt: "swip")]))
        //self.list.append(Checklist(txt: "List3", item: [ChecklistItem(txt: "Banane"),ChecklistItem(txt: "Pomme"),ChecklistItem(txt: "Poire")]))
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataModel.sharedInstance.list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checklistname", for: indexPath)
        cell.textLabel?.text = singleton.list[indexPath.row].text
        cell.imageView?.image = UIImage(named:singleton.list[indexPath.row].iconName)
        switch singleton.list[indexPath.row].uncheckedItemsCount {
        case 0:
            if singleton.list[indexPath.row].item.count != 0 {
                cell.detailTextLabel?.text = "All Done!"
            }else {
                cell.detailTextLabel?.text = "No Item"
            }
        case let x where x <= singleton.list[indexPath.row].item.count:
            cell.detailTextLabel?.text = String(x) + " Item"
        default:
            break
        }
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "checklistdetail",
            let destination = segue.destination as? ChecklistViewController,
            let cell = sender as? UITableViewCell,
            let row = self.tableView.indexPath(for: cell)?.row
        {
            destination.list = singleton.list[row]
        }
        if segue.identifier == "editItem" || segue.identifier == "addItem",
            let navcontroller = segue.destination as? UINavigationController,
            let destination = navcontroller.topViewController as? ListDetailViewController
        {
            destination.delegate = self
            if segue.identifier == "editItem" ,
                let cell = sender as? UITableViewCell ,
                let indexPath = self.tableView.indexPath(for: cell)
            {
                destination.itemToEdit = singleton.list[indexPath.row]
            }
        }
    }
    

}
