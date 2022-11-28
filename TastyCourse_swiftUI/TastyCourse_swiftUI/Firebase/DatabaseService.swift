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
    private var ordersRef: CollectionReference {
        return dtb.collection("orders")
    }
    
    private init() {}
    
    func getOrders(by userId: String?,
                   completion: @escaping (Result<[Order],Error>) -> Void) {
        self.ordersRef.getDocuments { qsnap, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            if let qsnap {
                var orders = [Order]()
                for doc in qsnap.documents {
                    if let userId {
                        // for concrete user
                if let order = Order(doc: doc), order.userId == userId {
                    orders.append(order)
                   }
                    } else {
                        // for all users(admin)
                        if let order = Order(doc: doc) {
                            orders.append(order)
                           }
                    }
                }
                completion(.success(orders))
            }
        }
    }
    
    func setOrder(order: Order,
                  completion: @escaping (Result<Order,Error>) -> Void) {
        ordersRef.document(order.id).setData(order.representation) { error in
            if let error {
                completion(.failure(error))
            } else {
                self.setPositions(to: order.id,
                                  positions: order.positions) { result in
                    switch result {
                    case .success(let positions):
                        print(positions.count)
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                    completion(.success(order))
                }
            }
        }
    }
    
    func setPositions(to orderId: String,
                      positions: [Position] ,
                      completion: @escaping (Result<[Position],Error>) -> Void) {
        let positionsRef = ordersRef.document(orderId).collection("positions")
        for position in positions {
            positionsRef.document(position.id).setData(position.representation)
        }
        completion(.success(positions))
    }
    
    func setProfile(user: MVUser,
                    completion: @escaping (Result<MVUser,Error>) -> Void) {
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
