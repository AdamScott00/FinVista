//
//  EditExpenseViewController.swift
//  FinVista
//
//  Created by Adam Scott on 2024-02-19.
//

import UIKit

class EditExpenseViewController: UIViewController, UITextFieldDelegate {
    
    var dismissalCallback: (() -> Void)?
    
    let context = ((UIApplication.shared.delegate) as! AppDelegate).persistentContainer.viewContext
    
    let nameLabel = UILabel()
    let nameTextField = UITextField()
    
    let priceLabel = UILabel()
    let priceTextField = UITextField()
    
    let dateLabel = UILabel()
    let datePicker = UIDatePicker()
    
    let doneButton = UIButton()
    
    var expense: Expense
    
    init(expense: Expense) {
        self.expense = expense
        super.init(nibName: nil, bundle: nil)

        setUIDataFromExpense(expense: expense)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .FVNavyBlue
        
        nameLabel.text = "Item Name: "
        nameLabel.textColor = .FVLynxWhite
        
        priceLabel.text = "Price: $"
        priceLabel.textColor = .FVLynxWhite
        
        dateLabel.text = "Date: "
        dateLabel.textColor = .FVLynxWhite
        
        nameTextField.placeholder = "'Apples'"
        nameTextField.delegate = self
        
        priceTextField.keyboardType = .numberPad
        priceTextField.placeholder = "123.45"
        priceTextField.delegate = self
        
        datePicker.date = .now
        datePicker.datePickerMode = .date
        
        doneButton.backgroundColor = .FVLynxWhite
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.systemBlue, for: .normal)
        doneButton.addTarget(self, action: #selector(doneTapped), for: .touchUpInside)
        
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(priceLabel)
        view.addSubview(priceTextField)
        view.addSubview(dateLabel)
        view.addSubview(datePicker)
        view.addSubview(doneButton)
        
        setConstraints()
    }
    
    private func setUIDataFromExpense(expense: Expense) {
        nameTextField.text = expense.name
        priceTextField.text = String(expense.price)
        datePicker.date = expense.date!
    }
    
    @objc private func doneTapped() {
        expense.date = datePicker.date
        expense.name = nameTextField.text
        
        guard let text = priceTextField.text, !text.isEmpty else {
            // Handle empty text case
            print("Empty text in price text field")
            return
        }
        
        if let doubleValue = Double(text) {
            expense.price = doubleValue
        }
        else {
            // Handle the case where the conversion fails
            print("Invalid input. Please enter a valid number.")
        }
        
        do {
            try self.context.save()
        }
        catch {
            print("Saving context failed")
        }
        
        dismissalCallback?()
        
        dismiss(animated: true)
    }
    
    private func setConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceTextField.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 64.0),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.0),
            nameTextField.widthAnchor.constraint(equalToConstant: 192.0),
            
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16.0),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0),
            
            priceTextField.topAnchor.constraint(equalTo: priceLabel.topAnchor),
            priceTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.0),
            priceTextField.widthAnchor.constraint(equalToConstant: 192.0),
            
            dateLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 64.0),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0),
            
            datePicker.topAnchor.constraint(equalTo: dateLabel.topAnchor),
            datePicker.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 32.0),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.0),
            
            doneButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 64.0),
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            doneButton.widthAnchor.constraint(equalToConstant: 64.0)
        ])
    }

}
