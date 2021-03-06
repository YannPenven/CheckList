//
//  ChecklistViewController+DelageteDatasource.swift
//  Checklists
//
//  Created by iem on 02/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import UIKit

extension ChecklistViewController: ItemDetailViewControllerDelegate {
    
    
    //MARK:TableView number of row
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let item = self.list?.item {
            return item.count
        }
        return 0
    }
    
    //MARK:Set Value for cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for:indexPath)
        configureCheckmarkFor(cell: cell, withItem: list.item[indexPath.row])
        configureTextFor(cell: cell, withItem: list.item[indexPath.row])
        return cell;
    }
    
    //MARK:Animate cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        tableView.deselectRow(at: indexPath, animated: true)
        list.item[indexPath.row].toggleChecked();
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        list.item.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .right)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "addItem" || segue.identifier == "editItem",
            let navcontroller = segue.destination as? UINavigationController,
             let destination = navcontroller.topViewController as? ItemDetailViewController
        {
            destination.delegate = self
            if segue.identifier == "editItem" ,
                let cell = sender as? UITableViewCell ,
                 let indexPath = self.tableView.indexPath(for: cell)
            {
                    destination.itemToEdit = self.list.item[indexPath.row]
            }
        }
    }
    
    func itemDetailViewControllerDidCancel(controller: ItemDetailViewController) {
        controller.dismiss(animated: true, completion: {})
    }
    
    func itemDetailViewController(controller: ItemDetailViewController, didFinishAddingItem item: ChecklistItem) {
        controller.dismiss(animated: true, completion: {})
        list.item.append(item)
        self.tableView.insertRows(at: [IndexPath(row: list.item.count - 1, section: 0)], with: .left)
        //saveChecklistItems()
    }
    
    func itemDetailViewController(controller: ItemDetailViewController, didFinishEditingItem item: ChecklistItem) {
        controller.dismiss(animated: true, completion: {})
        if let index = list.item.index(where:{ $0 === item }) {
            self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .left)
            //saveChecklistItems()
        }
    }
}
