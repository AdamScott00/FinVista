//
//  ExpenseHistoryTableViewCell.swift
//  FinVista
//
//  Created by Adam Scott on 2024-01-19.
//

import UIKit

class ExpenseHistoryTableViewCell: UITableViewCell {
    
    let dateTimeLabel = UILabel()
    let itemNameLabel = UILabel()
    let priceLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .FVLynxWhite
        
        dateTimeLabel.textColor = .FVNavyBlue
        itemNameLabel.textColor = .FVNavyBlue
        priceLabel.textColor = .FVNavyBlue
        
        contentView.addSubview(dateTimeLabel)
        contentView.addSubview(itemNameLabel)
        contentView.addSubview(priceLabel)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        dateTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateTimeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16.0),
            dateTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            
            itemNameLabel.topAnchor.constraint(equalTo: dateTimeLabel.bottomAnchor, constant: 8.0),
            itemNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24.0),
            
            priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 8.0),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
        ])
    }
}
