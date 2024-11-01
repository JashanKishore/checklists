//
//  Checklist.swift
//  Checklists
//
//  Created by Jashan kishore on 31/10/2024.
//

import UIKit

class Checklist: NSObject, Codable {
    var name: String
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
