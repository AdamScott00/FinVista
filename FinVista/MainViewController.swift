//
//  MainViewController.swift
//  FinVista
//
//  Created by Adam Scott on 2024-01-18.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let VC = DashboardViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
