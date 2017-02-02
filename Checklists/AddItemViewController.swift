//
//  AddItemViewController.swift
//  Checklists
//
//  Created by iem on 02/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController{
    
    var delegate:AddItemViewControllerDelegate?
    var itemToEdit:ChecklistItem?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBAction func done() {
        if let controller = delegate {
            if let txt = self.textField.text {
                if let item = itemToEdit {
                    item.text = txt
                    controller.addItemViewController(controller: self, didFinishEditingItem: item)
                }else {
                    controller.addItemViewController(controller: self, didFinishAddingItem: ChecklistItem(txt: txt))
                }
            }
        }
    }
    @IBAction func cancel() {
        if let controller = delegate {
            controller.addItemViewControllerDidCancel(controller: self)
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
        if var item = itemToEdit {
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
protocol AddItemViewControllerDelegate : class {
    func addItemViewControllerDidCancel(controller: AddItemViewController)
    func addItemViewController(controller: AddItemViewController, didFinishAddingItem item: ChecklistItem)
    func addItemViewController(controller: AddItemViewController, didFinishEditingItem item: ChecklistItem)
}
