//
//  HistoryController.swift
//  RandomNumberAPP
//
//  Created by Евгений Волков on 19.12.24.
//

import UIKit

class HistoryController: UIViewController {
    private let historyView = HistoryView()
    private let historyManager = HistoryManager()
    private let userID: String
    private var records: [HistoryRecord] = []
    
    init(userID: String) {
        self.userID = userID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = historyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "History"
        historyView.tableView.dataSource = self
        fetchHistory()
    }
    
    private func fetchHistory() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.historyManager.fetchHistory(userID: self?.userID ?? "") { records, error in
                if let error = error {
                    DispatchQueue.main.async {
                        self?.showAlert(message: "Failed to load history: \(error.localizedDescription)")
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    self?.records = records ?? []
                    self?.historyView.tableView.reloadData()
                }
            }
        }
    }

    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension HistoryController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let record = records[indexPath.row]
        cell.textLabel?.text = "Number: \(record.number)"
        cell.detailTextLabel?.text = "Date: \(record.timestamp)"
        return cell
    }
}

