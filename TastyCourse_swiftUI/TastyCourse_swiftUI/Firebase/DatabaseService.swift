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
    
    func setProfile(user: MVUser, completion: @escaping (Result<MVUser,Error>) -> Void) {
        usersRef.document(user.id).setData( user.representation ) { error  in
            if let error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    func getProfile(completion: @escaping (Result<MVUser,Error>) -> Void ) {
        usersRef.document(AuthService.shared.currentUser!.uid)
            .getDocument { docSnapshot, error in
                
                guard let docSnapshot,
                let data = docSnapshot.data() else { return }
                let name = data["name"] as? String ?? "no name"
                let id = data["id"] as? String ?? "no id"
                let phone = data["phone"] as? Int ?? 100000000
                let adress = data["adress"] as? String ?? "no adress"
                
                let user = MVUser(id: id,
                                  name: name,
                                  phone: phone,
                                  adress: adress)
                completion(.success(user))
                
            }
    }
}
