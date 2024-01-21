//
//  BalanceViewController.swift
//  FinVista
//
//  Created by Adam Scott on 2024-01-19.
//

import UIKit

class BalanceViewController: UIViewController, UITextFieldDelegate {
    
    let chequeingAccountView =  ValueTextFieldView()
    let savingsAccountView =  ValueTextFieldView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .FVFuegoGreen

        chequeingAccountView.titleLabel.text = "Chequeing: "
        chequeingAccountView.textField.delegate = self
        
        savingsAccountView.titleLabel.text = "Savings: "
        savingsAccountView.textField.delegate = self
        
        view.addSubview(chequeingAccountView)
        view.addSubview(savingsAccountView)
        
        setConstraints()
    }
    
    private func setConstraints() {
        let PREVIEW_VERTICAL_SPACING = 8.0
        let PREVIEW_LEADING_SPACING = 16.0
        let PREVIEW_TRAILING_SPACING = -1 * PREVIEW_LEADING_SPACING
        let PREVIEW_HEIGHT = 76.0
        
        chequeingAccountView.translatesAutoresizingMaskIntoConstraints = false
        savingsAccountView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            chequeingAccountView.topAnchor.constraint(equalTo: view.topAnchor, constant: 128.0),
            chequeingAccountView.heightAnchor.constraint(equalToConstant: PREVIEW_HEIGHT),
            chequeingAccountView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: PREVIEW_LEADING_SPACING),
            chequeingAccountView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: PREVIEW_TRAILING_SPACING),
            
            savingsAccountView.topAnchor.constraint(equalTo: chequeingAccountView.bottomAnchor, constant: PREVIEW_VERTICAL_SPACING),
            savingsAccountView.heightAnchor.constraint(equalToConstant: PREVIEW_HEIGHT),
            savingsAccountView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: PREVIEW_LEADING_SPACING),
            savingsAccountView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: PREVIEW_TRAILING_SPACING),
        ])
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textField.text
        let temp = 2 + 2
    }
    
}
