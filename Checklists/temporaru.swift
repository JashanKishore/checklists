//
//  temporaru.swift
//  Checklists
//
//  Created by Jashan kishore on 1/11/2024.
//

import Foundation
/*
// MARK: - Data Persistance
// Methods to save user data to documents
func documentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

func dataFilePath() -> URL {
    return documentsDirectory().appendingPathComponent("Checklist.plist")
}

func saveChecklistItems() {
    let encoder = PropertyListEncoder()
    do {
        let data = try encoder.encode(checklist.items)
        try data.write(to: dataFilePath(), options: .atomic)
    } catch {
        print("Error encoding checklist items: \(error.localizedDescription)")
    }
}

func loadChecklistItems() {
    let path = dataFilePath()
    if let data = try? Data(contentsOf: path) {
        let decoder = PropertyListDecoder()
        do {
            checklist.items = try decoder.decode([ChecklistItem].self, from: data)
        } catch {
            print("Error decoding checklist items: \(error.localizedDescription)")
        }
    }
}

*/
