//
//  AdminOrdersView.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 03.12.2022.
//

import SwiftUI

struct AdminOrdersView: View {
    @StateObject var viewModel = AdminOrdersViewModel()
    @State var isOrderViewShow = false
    
    var body: some View {
        List{
            ForEach(viewModel.orders, id: \.id) { order in
                OrderCell(order: order)
                    .onTapGesture {
                        viewModel.currentOrder = order
                        isOrderViewShow.toggle()
                    }
              }
            }
        .listStyle(.plain)
        .onAppear {
            viewModel.getOreders()
        }
        .sheet(isPresented: $isOrderViewShow) {
            let orderViewModel = OrderViewModel(order: viewModel.currentOrder)
            OrderView(viewModel: orderViewModel)
        }
    }
}

struct AdminOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        AdminOrdersView()
            .environmentObject(AdminOrdersViewModel())
    }
}
