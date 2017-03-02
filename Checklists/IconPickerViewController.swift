//
//  IconPickerViewController.swift
//  Checklists
//
//  Created by iem on 02/03/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import UIKit

class IconPickerViewController: UITableViewController {
    
    static let icons = [
        "Appointments",
        "Birthdays",
        "Chores",
        "Drinks",
        "Folder",
        "Groceries",
        "Inbox",
        "No Icon",
        "Photos",
        "Trips"]
    
    var delegate : IconPickerViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return IconPickerViewController.icons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        if let label = cell.textLabel,
            let imageview = cell.imageView {
            label.text = IconPickerViewController.icons[indexPath.row]
            imageview.image = UIImage(named:IconPickerViewController.icons[indexPath.row])
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath),
            let label = cell.textLabel,
            let text = label.text{
            delegate.ListDetailViewController(controller: self, didFinishSelectingItem: text)
            self.navigationController?.popViewController(animated: true)
        }else {
            delegate.ListDetailViewController(controller: self, didFinishSelectingItem: "No Icon")
        }
    }
}


