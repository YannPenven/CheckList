//
//  AddItemViewController+Delegate.swift
//  Checklists
//
//  Created by iem on 02/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import UIKit

extension AddItemViewController: UITextFieldDelegate {
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
