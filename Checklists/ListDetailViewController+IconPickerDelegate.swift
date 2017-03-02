//
//  ListDetailViewController.swift
//  Checklists
//
//  Created by iem on 02/03/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import UIKit

extension ListDetailViewController: IconPickerViewControllerDelegate {
    func ListDetailViewControllerDidCancel(controller: IconPickerViewController){
    }
    func ListDetailViewController(controller: IconPickerViewController, didFinishSelectingItem imageName: String){
            self.iconName = imageName
            self.imageView.image = UIImage(named: self.iconName)
    }
}
