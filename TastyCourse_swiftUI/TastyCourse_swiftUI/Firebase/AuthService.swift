//
//  AuthService.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 21.11.2022.
//

import Foundation
import FirebaseAuth

class AuthService {
    static let shared = AuthService()
    private init() {}
    
    private let auth = Auth.auth()
    private var currentUser: User? {
        return auth.currentUser
    }
    
    //register
    func sighnUp(email: String,
                 password: String,
                 completion: @escaping (Result<User,Error>) -> Void) {
        auth.createUser(withEmail: email, password: password ) { result, error in
            if let result {
                completion(.success(result.user))
            } else if let error {
                completion(.failure(error))
            }
        }
    }
    
    //
    
}
