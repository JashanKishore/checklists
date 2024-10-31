//
//  AllListsViewController.swift
//  Checklists
//
//  Created by Jashan kishore on 31/10/2024.
//

import UIKit

class AllListsViewController: UITableViewController {
    
    let cellIdentifier = "ChecklistCell"
    var lists = [Checklist]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        var list = Checklist(name: "First List")
        lists.append(list)
        
        list = Checklist(name: "Second List")
        lists.append(list)
        
        list = Checklist(name: "Third List")
        lists.append(list)
        
        list = Checklist(name: "Fourth List")
        lists.append(list)
    }
    
    func setup() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }

    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let checklist = lists[indexPath.row]
        cell.textLabel!.text = checklist.name
        cell.accessoryType = .detailDisclosureButton
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let checklist = lists[indexPath.row]
        performSegue(withIdentifier: "ShowChecklist", sender: checklist)
    }
    
    
    // MARK: - Navigation
    // Here you get a chance to set the properties of the new VC before it becomes visible
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChecklist" {
            let controller = segue.destination as! ChecklistViewController
            controller.checklist = sender as? Checklist
        }
    }

}
