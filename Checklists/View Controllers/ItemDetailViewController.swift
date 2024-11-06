//
//  itemDetailViewController.swift
//  Checklists
//
//  Created by Jashan kishore on 29/10/2024.
//

import UIKit

// Step 1. Define a delegate protocol for object B
protocol ItemDetailViewControllerDelegate: AnyObject {
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    // Step 2. Give object B an optional weak delegate variable
    weak var delegate: ItemDetailViewControllerDelegate?
    var itemToEdit: ChecklistItem?
    
    
    // MARK: - Outlets
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var shouldRemindSwitch: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        configureDatePicker()
        
        if let itemToEdit = itemToEdit {
            title = "Edit Item"
            textField.text = itemToEdit.text
            doneBarButton.isEnabled = true
            shouldRemindSwitch.isOn = itemToEdit.shouldRemind
            datePicker.date = itemToEdit.dueDate
        }
    }
    
    // Automatically show keyboard when visiting this screen
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    func configureDatePicker() {
        // Set minimum date of datePicker to current date
        let minDate = Date()
        datePicker.minimumDate = minDate
        // Set default date and time of datePicker to current date and time plus fifteen minutes
        let defaultDate = minDate.addingTimeInterval(900)
        datePicker.date = defaultDate
    }
    
    
    // MARK: - Actions
    @IBAction func cancelTapped() {
        // Step 3. Update obj B to send messages to delegate when something happens
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    
    @IBAction func doneTapped() {
        if let item = itemToEdit {
            item.text = textField.text!
            item.shouldRemind = shouldRemindSwitch.isOn
            item.dueDate = datePicker.date
            item.scheduleNotification()
            delegate?.itemDetailViewController(self, didFinishEditing: item)
        } else {
            let item = ChecklistItem(text: textField.text!)
            item.shouldRemind = shouldRemindSwitch.isOn
            item.dueDate = datePicker.date
            // Step 3.
            item.scheduleNotification()
            delegate?.itemDetailViewController(self, didFinishAdding: item)
        }
    }
    
    @IBAction func shouldRemindSwitchToggled(_ switchControl: UISwitch) {
        textField.resignFirstResponder()
        
        if switchControl.isOn {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert, .sound]) {_,_ in
                // do nothing
            }
        }
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
