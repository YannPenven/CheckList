//
//  ItemDetailViewController.swift
//  Checklists
//
//  Created by iem on 02/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import UIKit

class ItemDetailViewController: UITableViewController{
    
    var delegate:ItemDetailViewControllerDelegate?
    var itemToEdit:ChecklistItem?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBAction func done() {
        if let controller = delegate {
            if let txt = self.textField.text {
                if let item = itemToEdit {
                    item.text = txt
                    controller.itemDetailViewController(controller: self, didFinishEditingItem: item)
                }else {
                    controller.itemDetailViewController(controller: self, didFinishAddingItem: ChecklistItem(txt: txt))
                }
            }
        }
    }
    @IBAction func cancel() {
        if let controller = delegate {
            controller.itemDetailViewControllerDidCancel(controller: self)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let txt = self.textField{
            txt.becomeFirstResponder()
            txt.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = itemToEdit {
            textField.text = item.text
        }else {
            self.doneButton.isEnabled = false
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

//MARK:Protocole
protocol ItemDetailViewControllerDelegate : class {
    func itemDetailViewControllerDidCancel(controller: ItemDetailViewController)
    func itemDetailViewController(controller: ItemDetailViewController, didFinishAddingItem item: ChecklistItem)
    func itemDetailViewController(controller: ItemDetailViewController, didFinishEditingItem item: ChecklistItem)
}
