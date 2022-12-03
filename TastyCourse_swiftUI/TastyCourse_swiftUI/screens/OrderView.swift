//
//  OrderView.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 03.12.2022.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var viewModel: OrderViewModel
   
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("User \(viewModel.user.name)").font(.title).bold()
            Text("Phone \(viewModel.user.phone)").bold()
            Text("\(viewModel.user.adress)")
            List {
                ForEach(viewModel.order.positions) { position in
                    PositionCell(position: position)
                }
            }
            Text("Sum: \(viewModel.order.cost)$").bold()
        }
        .padding(16)
        .onAppear{
            viewModel.getUserData()
        }
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: OrderViewModel(order: Order(
            userId: "kTecgvRkYRPQkNlvZKP583h0GmF3",
            date: Date(),
            status: "New")))
           
    }
}
