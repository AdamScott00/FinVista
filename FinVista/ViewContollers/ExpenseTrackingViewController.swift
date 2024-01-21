//
//  ExpenseTrackingViewController.swift
//  FinVista
//
//  Created by Adam Scott on 2024-01-19.
//

import UIKit

class ExpenseTrackingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let headerTitle = UILabel()
    let totalExpensesLabel = UILabel()
    
    let expenseHistoryTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .FVFuegoGreen
        
        headerTitle.text = "Expense History"
        
        totalExpensesLabel.text = "Total: $10,000"
        totalExpensesLabel.textColor = .FVNavyBlue
        totalExpensesLabel.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
        
        setupTableView()
        
        view.addSubview(headerTitle)
        view.addSubview(totalExpensesLabel)
        view.addSubview(expenseHistoryTableView)
        
        setConstraints()
    }
    
    private func setupTableView() {
        expenseHistoryTableView.delegate = self
        expenseHistoryTableView.dataSource = self
        
        expenseHistoryTableView.backgroundColor = .FVLynxWhite
        
        expenseHistoryTableView.register(ExpenseHistoryTableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! ExpenseHistoryTableViewCell
        
        cell.dateTimeLabel.text = getCurrentDateTimeString()
        cell.itemNameLabel.text = "Item Name"
        cell.priceLabel.text = "$123.00"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    
    private func setConstraints() {
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        totalExpensesLabel.translatesAutoresizingMaskIntoConstraints = false
        expenseHistoryTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 128.0),
            headerTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            totalExpensesLabel.topAnchor.constraint(equalTo: headerTitle.bottomAnchor, constant: 32.0),
            totalExpensesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            expenseHistoryTableView.topAnchor.constraint(equalTo: totalExpensesLabel.bottomAnchor, constant: 64.0),
            expenseHistoryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -48.0),
            expenseHistoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            expenseHistoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            
        ])
    }
    
    
    ///
    func getCurrentDateTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // Define your desired date format

        let currentDateTime = Date()
        let formattedDateTimeString = dateFormatter.string(from: currentDateTime)

        return formattedDateTimeString
    }
    
}
