//
//  HistoryViewController.swift
//  RandomNumberAPP
//
//  Created by Евгений Волков on 19.12.24.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class HistoryViewController: UIViewController, UITableViewDataSource {
    
    private let tableView = UITableView()
    private var history: [String] = []
    private var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "History"
        
        db = Firestore.firestore()
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        loadHistory()
    }
    
    private func loadHistory() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        db.collection("users").document(userID).collection("history")
            .order(by: "timestamp", descending: true)
            .getDocuments { [weak self] snapshot, error in
                guard let self = self else { return }
                if let error = error {
                    print("Error fetching history: \(error)")
                    return
                }
                
                self.history = snapshot?.documents.compactMap { doc -> String? in
                    guard let number = doc.data()["number"] as? Int else { return nil }
                    return "\(number)"
                } ?? []
                self.tableView.reloadData()
            }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = history[indexPath.row]
        return cell
    }
}

