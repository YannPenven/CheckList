//
//  ItemDetailViewController+DatePicker.swift
//  Checklists
//
//  Created by iem on 09/03/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import UIKit

extension ItemDetailViewController {
    func showDatePicker(){
        self.datePickerVisible = !self.datePickerVisible
        self.tableView.insertRows(at: [IndexPath(row: 2, section: 1)], with: .fade)
        self.dateLabel.textColor = view.tintColor
    }
    func hideDatePicker(){
        self.datePickerVisible = !self.datePickerVisible
        self.tableView.deleteRows(at: [IndexPath(row: 2, section: 1)], with: .fade)
        self.dateLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        self.dateLabel.text = sender.date.toString()
    }
    
}
