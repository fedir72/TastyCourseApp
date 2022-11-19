//
//  PositionCell.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 19.11.2022.
//

import SwiftUI

struct PositionCell: View {
    let position: Position
    
    var body: some View {
        HStack {
            Text(position.product.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(position.count)")
            Text("\(position.cost)$")
                .frame(width: 85,alignment:  .trailing)
        }
    }
}

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        let prod = Product(id: "6",
                              title: "some big set",
                              imageUrl: "Not pizza",
                              price: 10,
                              descript: "Note: In that sense, a publisher is somewhat similar to a Swift iterator. One very valuable difference is that a Publisher’s completion could be either successful or a failure, and also that you need to actively pull values from an iterator, while a Publisher pushes values to its consumers.t",
                              ordersCount: 3,
                              isRecommend: true)
        let pos = Position(id: UUID().uuidString,
                           product: prod,
                           count: 3)
        PositionCell(position: pos)
    }
}
