//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by Jashan kishore on 29/10/2024.
//

import UIKit

// Step 1. Define a delegate protocol for object B
protocol AddItemTableViewControllerDelegate: AnyObject {
    func addItemTableViewControllerDidCancel(_ controller: AddItemTableViewController)
    func addItemTableViewController(_ controller: AddItemTableViewController, didFinishAdding item: ChecklistItem)
}

class AddItemTableViewController: UITableViewController, UITextFieldDelegate {
    // Step 2. Give object B an optional weak delegate variable
    weak var delegate: AddItemTableViewControllerDelegate?
    
    var itemToEdit: ChecklistItem?
    
    // MARK: - Outlets
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        if let itemToEdit = itemToEdit {
            title = "Edit Item"
            textField.text = itemToEdit.text
        }
    }
    
    
    // Automatically show keyboard when visiting this screen
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    
    // MARK: - Actions
    @IBAction func cancelTapped() {
        // Step 3. Update obj B to send messages to delegate when something happens
        delegate?.addItemTableViewControllerDidCancel(self)
    }
    
    @IBAction func doneTapped() {
        let item = ChecklistItem()
        item.text = textField.text!
        // Step 3.
        delegate?.addItemTableViewController(self, didFinishAdding: item)
    }
    
    
    // MARK: - Table View Delegates
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    
    // MARK: - Text Field Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        doneBarButton.isEnabled = !newText.isEmpty
        return true
    }
    
    // Use the clear button while also disabling done button correctly
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
}
