//
//  CatalogViewModel.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 18.11.2022.
//

import Foundation

class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    var popularProducts = [
        Product(id: "1",
                title: "big party set",
                imageUrl: "Not found",
                price: 10,
                descript: "Not found",
                ordersCount: 3,
                isRecommend: true),
        Product(id: "02",
                title: "small party set",
                imageUrl: "",
                price: 10,
                descript: "small set",
                ordersCount: 3,
                isRecommend: true),
        Product(id: "3",
                title: "big set",
                imageUrl: "Not found",
                price: 10,
                descript: "big set",
                ordersCount: 3,
                isRecommend: true),
        Product(id: "4",
                title: "big party set",
                imageUrl: "Not found",
                price: 10,
                descript: "Not found",
                ordersCount: 3,
                isRecommend: true),
        Product(id: "5",
                title: "small party set",
                imageUrl: "",
                price: 10,
                descript: "small set",
                ordersCount: 3,
                isRecommend: true),
        Product(id: "6",
                title: "big set",
                imageUrl: "Not found",
                price: 10,
                descript: "big set",
                ordersCount: 3,
                isRecommend: true)
        
        
    ]
    
    var pizzas = [
        Product(id: "1",
                title: "big party pizza",
                imageUrl: "Not found",
                price: 10,
                descript: "Not found",
                ordersCount: 3,
                isRecommend: true),
        Product(id: "02",
                title: "small party pizza",
                imageUrl: "",
                price: 10,
                descript: "small set",
                ordersCount: 3,
                isRecommend: true),
        Product(id: "3",
                title: "big set",
                imageUrl: "Not pizza",
                price: 10,
                descript: "big set",
                ordersCount: 3,
                isRecommend: true),
        Product(id: "4",
                title: "big party pizza",
                imageUrl: "Not found",
                price: 10,
                descript: "Not found",
                ordersCount: 3,
                isRecommend: true),
        Product(id: "5",
                title: "small party pizza",
                imageUrl: "",
                price: 10,
                descript: "small set",
                ordersCount: 3,
                isRecommend: true),
        Product(id: "6",
                title: "big set",
                imageUrl: "Not pizza",
                price: 10,
                descript: "big set",
                ordersCount: 3,
                isRecommend: true)
        
        
    ]
    
    
}
