//
//  DashboardSelectionView.swift
//  FinVista
//
//  Created by Adam Scott on 2024-01-18.
//

import UIKit

class DashboardSelectionView: UIView {

    let titleLabel = UILabel()
    let selectionChevron = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 0.9686, green: 0.97647, blue: 0.9686, alpha: 1)
        
        let navyBlue = UIColor(red: 0, green: 0.122, blue: 0.247, alpha: 1)
        
        titleLabel.textColor = navyBlue
        
        titleLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        
        selectionChevron.image = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18.0, weight: .bold))
        
        addSubview(titleLabel)
        addSubview(selectionChevron)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        selectionChevron.translatesAutoresizingMaskIntoConstraints  = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.0),
            
            selectionChevron.centerYAnchor.constraint(equalTo: centerYAnchor),
            selectionChevron.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12.0)
        ])
    }
}
