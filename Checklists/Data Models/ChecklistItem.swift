//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Jashan kishore on 28/10/2024.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = false
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1
    
    init(text: String, checked: Bool = false) {
        self.text = text
        self.checked = checked
        self.itemID = DataModel.nextChecklistItemID()
    }
}
