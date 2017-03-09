//
//  ItemDetailsViewController+TableViewDelegate.swift
//  Checklists
//
//  Created by iem on 09/03/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import UIKit

extension ItemDetailViewController {
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let cell = tableView.cellForRow(at: indexPath)
        if let identifier = cell?.reuseIdentifier,
            identifier == "dueDateCell" {
            self.textField.endEditing(true)
            return indexPath
        }
        return super.tableView(tableView, willSelectRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 2 && indexPath.section == 1 {
            return self.datePickerCell
        }
        return super.tableView(tableView, cellForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            if self.datePickerVisible {
                return 3
            }
            return 2
        }
        return super.tableView(tableView, numberOfRowsInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 && indexPath.row == 2{
            return 217
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 1 {
            if self.datePickerVisible {
                hideDatePicker()
            }else {
                showDatePicker()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        if indexPath.row == 2 && indexPath.section == 1 {
            return super.tableView(tableView, indentationLevelForRowAt: IndexPath(row: 0, section: 1))
        }
        return super.tableView(tableView, indentationLevelForRowAt: indexPath)
    }
}
