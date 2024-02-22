//
//  ExpenseTrackingViewController.swift
//  FinVista
//
//  Created by Adam Scott on 2024-01-19.
//

import UIKit
import CoreData

class ExpenseTrackingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dismissalCallback: (() -> Void)?
    
    let context = ((UIApplication.shared.delegate) as! AppDelegate).persistentContainer.viewContext
    
    var expenses: [Expense]?
    
    let addExpenseButton = UIButton()
    let headerTitle = UILabel()
    let totalExpensesLabel = UILabel()
    
    let expenseHistoryTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .FVFuegoGreen
        
        addExpenseButton.setTitle("Add", for: .normal)
        addExpenseButton.backgroundColor = .FVNavyBlue
        addExpenseButton.setTitleColor(.FVLynxWhite, for: .normal)
        addExpenseButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        headerTitle.text = "Expense History"
        
        totalExpensesLabel.text = "Total: $10,000"
        totalExpensesLabel.textColor = .FVNavyBlue
        totalExpensesLabel.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
        
        setupTableView()
        
        view.addSubview(addExpenseButton)
        view.addSubview(headerTitle)
        view.addSubview(totalExpensesLabel)
        view.addSubview(expenseHistoryTableView)
        
        setConstraints()
        
        fetchExpenses()
    }
    
    private func fetchExpenses() {
        do {
            self.expenses = try context.fetch(Expense.fetchRequest())
            
            DispatchQueue.main.async {
                self.expenseHistoryTableView.reloadData()
                self.totalExpensesLabel.text = "$" + String(format: "%.2f", self.getExpenseTotal())
            }
            
        }
        catch {
        }
    }
    
    private func getExpenseTotal() -> Double {
        return expenses?.reduce(0.0) { (result, expense) in
            return result + expense.price
        } ?? 0.0
    }
    
    @objc private func addButtonTapped() {
        let VC = CreateExpenseViewController()
        
        VC.dismissalCallback = { [weak self] in
            print("Presented view controller dismissed")
            
            self?.fetchExpenses()
        }
        
        self.navigationController?.present(VC, animated: true)
    }
    
    private func setupTableView() {
        expenseHistoryTableView.delegate = self
        expenseHistoryTableView.dataSource = self
        
        expenseHistoryTableView.backgroundColor = .FVLynxWhite
        
        expenseHistoryTableView.register(ExpenseHistoryTableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.expenses?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expense = self.expenses![indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! ExpenseHistoryTableViewCell
        
        cell.dateTimeLabel.text = getFormattedDateString(from: expense.date ?? Date())
        cell.itemNameLabel.text = expense.name
        cell.priceLabel.text = "$" + String(format: "%.2f", expense.price)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let expenseToUpdate = self.expenses![indexPath.row]
        
        let VC = EditExpenseViewController(expense: expenseToUpdate)
        
        VC.dismissalCallback = { [weak self] in
            print("Presented view controller dismissed")
            
            self?.fetchExpenses()
        }
        
        self.navigationController?.present(VC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            let expenseToRemove = self.expenses![indexPath.row]
            
            self.context.delete(expenseToRemove)
            
            do {
                try self.context.save()
            }
            catch {
                
            }
            
            self.fetchExpenses()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76.0
    }

    
    private func setConstraints() {
        addExpenseButton.translatesAutoresizingMaskIntoConstraints = false
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        totalExpensesLabel.translatesAutoresizingMaskIntoConstraints = false
        expenseHistoryTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addExpenseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 96.0),
            addExpenseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            addExpenseButton.widthAnchor.constraint(equalToConstant: 64.0),
            
            headerTitle.topAnchor.constraint(equalTo: addExpenseButton.bottomAnchor, constant: 32.0),
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
    
    func getFormattedDateString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // Define your desired date format

        let formattedDateTimeString = dateFormatter.string(from: date)

        return formattedDateTimeString
    }
    
}
