//
//  OrderCell.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 28.11.2022.
//

import SwiftUI

struct OrderCell: View {
    @State var order: Order
    
    var body: some View {
        HStack {
            Text("\(order.date)")
            Text("\(order.cost)").bold().frame(width:90)
            Text("\(order.status)").frame(width: 100).foregroundColor(.green)
        }
    }
}

struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
        let ord = Order(userId: "User id",
                           date: Date(),
                           status: "New order")
        OrderCell(order: ord)
    }
}
