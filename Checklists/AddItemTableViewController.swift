//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by Jashan kishore on 29/10/2024.
//

import UIKit

class AddItemTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Actions
    @IBAction func cancelTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doneTapped() {
        navigationController?.popViewController(animated: true)
    }
}
