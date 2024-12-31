//
//  HistoryModel.swift
//  RandomNumberAPP
//
//  Created by Евгений Волков on 19.12.24.
//

import Foundation
import FirebaseFirestore

struct HistoryRecord {
    let number: Int
    let timestamp: Date
}

class HistoryManager {
    private let db = Firestore.firestore()
    
    func saveHistoryRecord(userID: String, number: Int, completion: @escaping (Error?) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            let record = [
                "number": number,
                "timestamp": Timestamp(date: Date())
            ] as [String : Any]
            
            self.db.collection("users").document(userID).collection("history").addDocument(data: record) { error in
                DispatchQueue.main.async {
                    completion(error)
                }
            }
        }
    }
    
    func fetchHistory(userID: String, completion: @escaping ([HistoryRecord]?, Error?) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            self.db.collection("users").document(userID).collection("history")
                .order(by: "timestamp", descending: true)
                .getDocuments { snapshot, error in
                    if let error = error {
                        DispatchQueue.main.async {
                            completion(nil, error)
                        }
                        return
                    }
                    
                    let records = snapshot?.documents.compactMap { doc -> HistoryRecord? in
                        guard let number = doc["number"] as? Int,
                              let timestamp = (doc["timestamp"] as? Timestamp)?.dateValue() else { return nil }
                        return HistoryRecord(number: number, timestamp: timestamp)
                    }
                    
                    DispatchQueue.main.async {
                        completion(records, nil)
                    }
                }
        }
    }
}




