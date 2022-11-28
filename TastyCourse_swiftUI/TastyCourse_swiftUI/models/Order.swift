//
//  Order.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 28.11.2022.
//

import Foundation
import FirebaseFirestore

struct Order: Identifiable {
    var id: String = UUID().uuidString
    var userId: String
    var positions = [Position]()
    var date: Date
    var status: String
    
    var cost: Int {
        return positions.reduce(0) { $0 + $1.cost }
    }
    
    var representation: [String: Any] {
        return [
            "id": id,
            "userId": userId,
            "date": Timestamp(date: Date()), 
            "status": status
        ]
    }
    
    init(userId: String, date: Date, status: String ){
        //var id: String = UUID().uuidString
        self.userId = userId
        //var positions = [Position]()
        self.date = date
        self.status = status
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        guard let id = data["id"] as? String else {return nil}
        guard let userId = data["userId"] as? String else {return nil}
        guard let date = data["date"] as? Timestamp else {return nil}
        guard let status = data["status"] as? String else {return nil}
        
        self.id = id
        self.userId = userId
        self.date = date.dateValue()
        self.status = status
    }
}
