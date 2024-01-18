//
//  DashboardViewController.swift
//  FinVista
//
//  Created by Adam Scott on 2024-01-18.
//

import UIKit

class DashboardViewController: UIViewController {

    let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem?.isEnabled = false
        
        titleLabel.text = "FinVista"
        
        view.addSubview(titleLabel)
        
        setConstraints()
    }
    
    func setConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 128.0),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
