//
//  ProductDetailViewmodel.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 19.11.2022.
//

import Foundation

class ProductDetailModelView: ObservableObject {
      
    @Published var product: Product
    @Published var sizes = ["small","medium","big","extra large"]
    @Published var count = 0
    
    init(product: Product) {
        self.product = product
    }
    
    func getPrice(size: String) -> Int {
        switch size {
        case "extra large": return Int(product.price.getDouble()*2.5)
        case "big": return Int(product.price.getDouble()*2)
        case "medium" : return Int(product.price.getDouble()*1.5)
        default: return product.price
        }
    }
}
