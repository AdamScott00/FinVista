//
//  DashboardViewController.swift
//  FinVista
//
//  Created by Adam Scott on 2024-01-18.
//

import UIKit

class DashboardViewController: UIViewController {

    let titleLabel = UILabel()
    let balancePreview = ValuePreviewView()
    let incomePreview = ValuePreviewView()
    let assetsPreview = ValuePreviewView()
    let expensesPreview = ValuePreviewView()
    let goalsSelectionView = DashboardSelectionView()
    let investmentsSelectionView = DashboardSelectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem?.isEnabled = false
        view.backgroundColor = .FVFuegoGreen
        
        titleLabel.text = "FinVista"
        titleLabel.textColor = .FVNavyBlue
        titleLabel.backgroundColor = .FVLynxWhite
        titleLabel.font = UIFont.systemFont(ofSize: 26.0, weight: .bold)
        
        setupSubviews()
        
        view.addSubview(titleLabel)
        view.addSubview(balancePreview)
        view.addSubview(incomePreview)
        view.addSubview(assetsPreview)
        view.addSubview(expensesPreview)
        view.addSubview(goalsSelectionView)
        view.addSubview(investmentsSelectionView)
        
        setConstraints()
    }
    
    private func setupSubviews() {
        balancePreview.titleLabel.text = "Balance"
        balancePreview.subtitleLabel.text = "Total: "
        balancePreview.valueLabel.text = "$590,000"
        balancePreview.viewTapped(target: self, action: #selector(balanceViewTapped))
        
        incomePreview.titleLabel.text = "Income"
        incomePreview.subtitleLabel.text = "Total: "
        incomePreview.valueLabel.text = "$100,000"
        
        assetsPreview.titleLabel.text = "Assets"
        assetsPreview.subtitleLabel.text = "Total: "
        assetsPreview.valueLabel.text = "$900,000"
        
        expensesPreview.titleLabel.text = "Expenses"
        expensesPreview.subtitleLabel.text = "Per Month: "
        expensesPreview.valueLabel.text = "$1,500"
        expensesPreview.viewTapped(target: self, action: #selector(expensesViewTapped))
        
        goalsSelectionView.titleLabel.text = "Goals"
        
        investmentsSelectionView.titleLabel.text = "Investments"
    }
    
    @objc private func balanceViewTapped(_ sender: UITapGestureRecognizer) {
        let VC = BalanceViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @objc private func expensesViewTapped(_ sender: UITapGestureRecognizer) {
        let VC = ExpenseTrackingViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    private func setConstraints() {
        let PREVIEW_VERTICAL_SPACING = 8.0
        let PREVIEW_LEADING_SPACING = 16.0
        let PREVIEW_TRAILING_SPACING = -1 * PREVIEW_LEADING_SPACING
        let PREVIEW_HEIGHT = 76.0
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        balancePreview.translatesAutoresizingMaskIntoConstraints = false
        incomePreview.translatesAutoresizingMaskIntoConstraints = false
        assetsPreview.translatesAutoresizingMaskIntoConstraints = false
        expensesPreview.translatesAutoresizingMaskIntoConstraints = false
        goalsSelectionView.translatesAutoresizingMaskIntoConstraints = false
        investmentsSelectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 128.0),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            balancePreview.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 48.0),
            balancePreview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: PREVIEW_LEADING_SPACING),
            balancePreview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: PREVIEW_TRAILING_SPACING),
            balancePreview.heightAnchor.constraint(equalToConstant: PREVIEW_HEIGHT),
            
            incomePreview.topAnchor.constraint(equalTo: balancePreview.bottomAnchor, constant: PREVIEW_VERTICAL_SPACING),
            incomePreview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: PREVIEW_LEADING_SPACING),
            incomePreview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: PREVIEW_TRAILING_SPACING),
            incomePreview.heightAnchor.constraint(equalToConstant: PREVIEW_HEIGHT),
            
            assetsPreview.topAnchor.constraint(equalTo: incomePreview.bottomAnchor, constant: PREVIEW_VERTICAL_SPACING),
            assetsPreview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: PREVIEW_LEADING_SPACING),
            assetsPreview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: PREVIEW_TRAILING_SPACING),
            assetsPreview.heightAnchor.constraint(equalToConstant: PREVIEW_HEIGHT),
            
            expensesPreview.topAnchor.constraint(equalTo: assetsPreview.bottomAnchor, constant: PREVIEW_VERTICAL_SPACING),
            expensesPreview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: PREVIEW_LEADING_SPACING),
            expensesPreview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: PREVIEW_TRAILING_SPACING),
            expensesPreview.heightAnchor.constraint(equalToConstant: PREVIEW_HEIGHT),
            
            goalsSelectionView.topAnchor.constraint(equalTo: expensesPreview.bottomAnchor, constant: PREVIEW_VERTICAL_SPACING),
            goalsSelectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: PREVIEW_LEADING_SPACING),
            goalsSelectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: PREVIEW_TRAILING_SPACING),
            goalsSelectionView.heightAnchor.constraint(equalToConstant: PREVIEW_HEIGHT),
            
            investmentsSelectionView.topAnchor.constraint(equalTo: goalsSelectionView.bottomAnchor, constant: PREVIEW_VERTICAL_SPACING),
            investmentsSelectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: PREVIEW_LEADING_SPACING),
            investmentsSelectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: PREVIEW_TRAILING_SPACING),
            investmentsSelectionView.heightAnchor.constraint(equalToConstant: PREVIEW_HEIGHT),
        ])
    }
}
