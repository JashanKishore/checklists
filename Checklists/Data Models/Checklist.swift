//
//  Checklist.swift
//  Checklists
//
//  Created by Jashan kishore on 31/10/2024.
//

import UIKit

class Checklist: NSObject, Codable {
    var name: String
    var iconName = "Appointments"
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
    func countCheckedItems() -> Int {
        var count = 0
        for item in items where !item.checked {
                count += 1
        }
        return count
    }
}
