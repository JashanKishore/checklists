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
    
    init(text: String, checked: Bool = false) {
        self.text = text
        self.checked = checked
    }
}
