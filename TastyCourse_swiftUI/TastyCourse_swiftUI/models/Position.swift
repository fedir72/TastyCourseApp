//
//  Position.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 19.11.2022.
//

import Foundation

struct Position: Identifiable {
    var id: String
    var product: Product
    var count: Int
    var cost: Int {
       return product.price * count
    }
}
