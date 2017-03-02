//
//  ViewController.swift
//  Checklists
//
//  Created by iem on 02/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    //var checklist = [ChecklistItem]()
    var list: Checklist!

    override func viewDidLoad() {
        super.viewDidLoad()
        if (self.list) == nil {
            self.list = Checklist(txt: "Eror")
            self.title = self.list.text
        }else {
            self.title = self.list.text
        }
        //loadChecklistItems()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    //MARK:configure field in cell
    func configureCheckmarkFor(cell: UITableViewCell, withItem item: ChecklistItem){
        if let checkmark = cell.viewWithTag(1) as? UILabel {
            checkmark.textColor = view.tintColor
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
    
}



