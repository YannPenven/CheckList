//
//  AllListViewController+ListDetailViewControllerDelegate.swift
//  Checklists
//
//  Created by iem on 09/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import Foundation

extension AllListViewController: ListDetailViewControllerDelegate {
    func ListDetailViewControllerDidCancel(controller: ListDetailViewController){
        controller.dismiss(animated: true, completion: {})
    }
    func ListDetailViewController(controller: ListDetailViewController, didFinishAddingItem item: Checklist){
        controller.dismiss(animated: true, completion: {})
        self.list.append(item)
        self.tableView.insertRows(at: [IndexPath(row: list.count - 1, section: 0)], with: .left)
        //DataModel.sharedInstance.saveChecklist()
    }
    func ListDetailViewController(controller: ListDetailViewController, didFinishEditingItem item: Checklist){
        controller.dismiss(animated: true, completion: {})
        if let index = self.list.index(where:{ $0 === item }) {
            self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .left)
            //DataModel.sharedInstance.saveChecklist()
        }
    }
}
