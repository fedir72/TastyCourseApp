//
//  Position.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 19.11.2022.
//

import Foundation
import FirebaseFirestore

struct Position: Identifiable {
    var id: String
    var product: Product
    var count: Int
    
    var cost: Int {
       return product.price * count
    }
    
    var representation: [String:Any] {
        return [
            "id"   : id,
            "count": count,
            "title": product.title,
            "price": product.price,
            "cost" : cost
        ]
    }
    
    internal init(id: String, product: Product, count: Int) {
        self.id = id
        self.product = product
        self.count = count
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        guard let id = data["id"] as? String else { return nil }
        guard let price = data["price"] as? Int else { return nil }
        guard let title = data["title"] as? String else { return nil }
        let product: Product = Product(id: "",
                                       title: title,
                                       imageUrl: "",
                                       price: price,
                                       descript: "")
        guard let count = data["count"] as? Int else { return nil }
        self.id = id
        self.product = product
        self.count = count
    }
}
