//
//  ViewController.swift
//  Checklists
//
//  Created by iem on 02/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var checklist = [ChecklistItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        checklist.append(ChecklistItem(txt: "blabalblsoijqozfhd"))
        checklist.append(ChecklistItem(txt: "254512515311"))
        checklist.append(ChecklistItem(txt: "qzdqzdqzdqzd"))
        checklist.append(ChecklistItem(txt: "qazds5q1zd5eg454th5yj4"))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:configure field in cell
    func configureCheckmarkFor(cell: UITableViewCell, withItem item: ChecklistItem){
        if let checkmark = cell.viewWithTag(1) {
            if item.checked {
                checkmark.isHidden = false
            }else{
                checkmark.isHidden = true
            }
         }
    }
    func configureTextFor(cell: UITableViewCell, withItem item: ChecklistItem){
        if let label = cell.viewWithTag(2) as? UILabel{
            label.text = item.text
        }
    }
    
    /*@IBAction func addDummyTodo(_ sender: UIBarButtonItem) {
        checklist.append(ChecklistItem(txt: "WHIIIOOOOOOOOOOOOOOOAAAAA"))
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: checklist.count-1, section: 0)], with: .left)
        tableView.endUpdates()
    }*/
}



