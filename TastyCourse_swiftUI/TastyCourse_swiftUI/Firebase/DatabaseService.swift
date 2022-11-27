//
//  DatabaseService.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 27.11.2022.
//

import Foundation
import FirebaseFirestore

class DatabaseService {
    static let shared = DatabaseService()
    
    private let dtb = Firestore.firestore()
    private var usersRef: CollectionReference {
        return dtb.collection("users")
    }
    
    private init() {}
    
    func setUser(user: MVUser, completion: @escaping (Result<MVUser,Error>) -> Void) {
        usersRef.document(user.id).setData( user.representation ) { error  in
            if let error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
}
