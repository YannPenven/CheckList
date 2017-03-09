//
//  ItemDetailViewController.swift
//  Checklists
//
//  Created by iem on 02/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import UIKit
import UserNotifications

class ItemDetailViewController: UITableViewController, UNUserNotificationCenterDelegate{
    
    var delegate:ItemDetailViewControllerDelegate?
    var itemToEdit:ChecklistItem?
    var dueDate: Date = Date.init()
    var datePickerVisible = false
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var remindSwitch: UISwitch!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePickerCell: UITableViewCell!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func done() {
        if let controller = delegate {
            let tmp = self.dueDate.timeIntervalSince(Date.init())
            if let txt = self.textField.text {
                if let item = itemToEdit {
                    deleteNotification(title: item.text)
                    item.text = txt
                    item.dueDate = self.dueDate
                    item.shouldRemind = remindSwitch.isOn
                    if remindSwitch.isOn {
                        if buildNotfication(title: txt, timeInterval: self.dueDate.timeIntervalSince(Date.init())) {
                            controller.itemDetailViewController(controller: self, didFinishEditingItem: item)
                        }
                    }else {
                        controller.itemDetailViewController(controller: self, didFinishEditingItem: item)
                    }
                }else {
                    if remindSwitch.isOn {
                        if buildNotfication(title: txt, timeInterval: self.dueDate.timeIntervalSince(Date.init())) {
                            controller.itemDetailViewController(controller: self, didFinishAddingItem: ChecklistItem(txt: txt, checked: false, shouldRemind: self.remindSwitch.isOn, dueDate: self.dueDate))
                        }
                    }else {
                        controller.itemDetailViewController(controller: self, didFinishAddingItem: ChecklistItem(txt: txt, checked: false, shouldRemind: self.remindSwitch.isOn, dueDate: self.dueDate))
                    }
                    
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
            self.textField.text = item.text
            self.remindSwitch.isOn = item.shouldRemind
            self.dueDate = item.dueDate
            self.dateLabel.text = item.dueDate.toString()
        }else {
            self.doneButton.isEnabled = false
            dateLabel.text = dueDate.toString()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildNotfication(title: String, timeInterval: TimeInterval) -> Bool{
        var notificationHasBeenCreated = false
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if granted {
                let notification = UNMutableNotificationContent()
                notification.title = title
                notification.body = "Little Reminder you need to do something today \\o/"
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
                let request = UNNotificationRequest(identifier: "ReminderNotification:" + title, content: notification, trigger: trigger)
                
                UNUserNotificationCenter.current().delegate = self
                UNUserNotificationCenter.current().add(request, withCompletionHandler: {(error) in })
                notificationHasBeenCreated = true
            }
        }
        return notificationHasBeenCreated
    }
    
    func deleteNotification(title: String){
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: ["ReminderNotification:" + title])
    }
}

//MARK:Protocole
protocol ItemDetailViewControllerDelegate : class {
    func itemDetailViewControllerDidCancel(controller: ItemDetailViewController)
    func itemDetailViewController(controller: ItemDetailViewController, didFinishAddingItem item: ChecklistItem)
    func itemDetailViewController(controller: ItemDetailViewController, didFinishEditingItem item: ChecklistItem)
}
