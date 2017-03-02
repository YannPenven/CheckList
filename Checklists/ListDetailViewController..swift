//
//  ListDetailViewController..swift
//  Checklists
//
//  Created by iem on 09/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import UIKit

class ListDetailViewController: UITableViewController {
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var textfield: UITextField!
    var delegate: ListDetailViewControllerDelegate?
    var itemToEdit:Checklist?
    var iconName = "No Icon"
    
    @IBOutlet weak var imageName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func done() {
        if let controller = delegate,
            let txt = self.textfield.text {
                if let item = itemToEdit {
                    item.text = txt
                    item.iconName = iconName
                    controller.ListDetailViewController(controller: self, didFinishEditingItem: item)
                }else {
                    controller.ListDetailViewController(controller: self, didFinishAddingItem: Checklist(txt: txt, iconName: iconName))
                }
        }
    }
    
    @IBAction func cancel() {
        if let controller = delegate {
            controller.ListDetailViewControllerDidCancel(controller: self)
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let item = itemToEdit {
            self.title = "Edit List"
            textfield.text = item.text
            imageView.image = UIImage(named: item.iconName)
        }else {
            self.imageView.image = #imageLiteral(resourceName: "Folder")
            self.doneButton.isEnabled = false
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let txt = self.textfield{
            txt.becomeFirstResponder()
            txt.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "iconPicker"{
            let destination = segue.destination as! IconPickerViewController
            destination.delegate = self
        }
    }
}

//MARK:Protocole
protocol ListDetailViewControllerDelegate : class {
    func ListDetailViewControllerDidCancel(controller: ListDetailViewController)
    func ListDetailViewController(controller: ListDetailViewController, didFinishAddingItem item: Checklist)
    func ListDetailViewController(controller: ListDetailViewController, didFinishEditingItem item: Checklist)
}
