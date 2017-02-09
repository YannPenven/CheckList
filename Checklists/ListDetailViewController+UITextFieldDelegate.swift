//
//  AllListViewController+UITextFieldDelegate.swift
//  Checklists
//
//  Created by iem on 09/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import Foundation
import UIKit

extension ListDetailViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let str = textField.text?.characters {
            if !string.isEmpty || (str.count) > 1 {
                self.doneButton.isEnabled = true
            }else {
                self.doneButton.isEnabled = false
            }
        }
        return true
    }
}
