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
    
}
