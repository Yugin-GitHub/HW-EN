//
//  UserModel.swift
//  RandomNumberAPP
//
//  Created by Евгений Волков on 19.12.24.
//

import Foundation
import FirebaseAuth

struct UserModel {
    let uid: String
    let email: String
}

class AuthManager {
    func registerUser(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let user = result?.user {
                let userModel = UserModel(uid: user.uid, email: user.email ?? "")
                completion(.success(userModel))
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let user = result?.user {
                let userModel = UserModel(uid: user.uid, email: user.email ?? "")
                completion(.success(userModel))
            }
        }
    }
    
    func logoutUser(completion: @escaping (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch {
            completion(false)
        }
    }
}

