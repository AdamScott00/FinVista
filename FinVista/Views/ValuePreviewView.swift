//
//  ValuePreviewView.swift
//  FinVista
//
//  Created by Adam Scott on 2024-01-18.
//

import UIKit

class ValuePreviewView: UIView {

    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let valueLabel = UILabel()
    let selectionChevron = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .FVLynxWhite
        
        titleLabel.textColor = .FVNavyBlue
        subtitleLabel.textColor = .FVNavyBlue
        valueLabel.textColor = .FVNavyBlue
        
        titleLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        subtitleLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
        valueLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        
        selectionChevron.image = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18.0, weight: .bold))
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(valueLabel)
        addSubview(selectionChevron)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        selectionChevron.translatesAutoresizingMaskIntoConstraints  = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.0),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16.0),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            valueLabel.topAnchor.constraint(equalTo: subtitleLabel.topAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor, constant: 16.0),
            
            selectionChevron.centerYAnchor.constraint(equalTo: centerYAnchor),
            selectionChevron.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12.0)
        ])
    }
}
