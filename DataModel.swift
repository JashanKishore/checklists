//
//  DataModel.swift
//  Checklists
//
//  Created by Jashan kishore on 1/11/2024.
//

import Foundation

class DataModel {
    
    var lists = [Checklist]()
    
    var indexOfSelectedChecklist: Int {
        get {
            UserDefaults.standard.integer(forKey: "ChecklistIndex")
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "ChecklistIndex")
        }
    }
    
    init() {
        loadChecklists()
        registerDefaults()
    }
    
    func registerDefaults() {
        let dictionary = ["ChecklistIndex": -1 ]
        UserDefaults.standard.register(defaults: dictionary)
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklist.plist")
    }

    func saveChecklists() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(lists)
            try data.write(to: dataFilePath(), options: .atomic)
        } catch {
            print("Error encoding checklists: \(error.localizedDescription)")
        }
    }

    func loadChecklists() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                lists = try decoder.decode([Checklist].self, from: data)
            } catch {
                print("Error decoding checklists: \(error.localizedDescription)")
            }
        }
    }
}
