//
//  ProductCell.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 18.11.2022.
//

import SwiftUI

struct ProductCell: View {
    
   var product: Product
    
    var body: some View {
        VStack(spacing: 4) {
            Image("sushi")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(maxWidth: screen.width*0.45)
                .clipped()
                .cornerRadius(10)
                //.frame(width: 100, height: 100)
            HStack {
                Text(product.title)
                    .font(.subheadline)
                Spacer()
                Text("\(product.price)$")
                    .font(.subheadline.bold())
            }
            .foregroundColor(Color.black)
            .padding(.horizontal,4)
            .padding(.bottom, 4)
        }
        .frame(width: screen.width*0.45 ,
               height: screen.width*0.65)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray,radius: 10, x: 10)
        
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        let prod = Product(id: "",
                           title: "big party set",
                           imageUrl: "",
                           price: 10,
                           descript: ""
//                           ordersCount: 3,
//                           isRecommend: true
        )
        
        ProductCell(product: prod)
         
    }
}
