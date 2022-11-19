//
//  ProductDetailView.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 19.11.2022.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    
    var body: some View {
        Text("Product \(product.title)")
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(id: "4",
                                           title: "big party pizza",
                                           imageUrl: "Not found",
                                           price: 10,
                                           descript: "Not found",
                                           ordersCount: 3,
                                           isRecommend: true))
    }
}
