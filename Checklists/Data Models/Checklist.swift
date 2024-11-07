//
//  Checklist.swift
//  Checklists
//
//  Created by Jashan kishore on 31/10/2024.
//

import UIKit

class Checklist: NSObject, Codable {
    var name: String
    var iconName = "No Icon"
    var items = [ChecklistItem]()
    
    init(name: String, iconName: String = "No Icon") {
        self.name = name
        self.name = iconName
        super.init()
    }
    
    func countCheckedItems() -> Int {
        var count = 0
        for item in items where !item.checked {
                count += 1
        }
        return count
    }
    
    // Sort items in checklist by their due date by comparing date objects
    func sortItems() {
        items.sort { $0.dueDate < $1.dueDate }
    }
    
}
