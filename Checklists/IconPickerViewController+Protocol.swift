//
//  IconPickerViewController+Protocol.swift
//  Checklists
//
//  Created by iem on 02/03/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import Foundation

protocol IconPickerViewControllerDelegate : class {
    func ListDetailViewControllerDidCancel(controller: IconPickerViewController)
    func ListDetailViewController(controller: IconPickerViewController, didFinishSelectingItem imageName: String)
}
