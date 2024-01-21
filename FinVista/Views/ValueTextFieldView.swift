//
//  ValueTextFieldView.swift
//  FinVista
//
//  Created by Adam Scott on 2024-01-19.
//

import UIKit

class ValueTextFieldView: UIView {
    
    let titleLabel = UILabel()
    let textField = UITextField()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .FVLynxWhite
        
        titleLabel.textColor = .FVNavyBlue
        textField.backgroundColor = .FVNavyBlue
        
        addSubview(titleLabel)
        addSubview(textField)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.widthAnchor.constraint(equalToConstant: 96.0),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0)
        ])
    }

}
