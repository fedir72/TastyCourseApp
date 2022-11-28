//
//  CartView.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 18.11.2022.
//

import SwiftUI

struct CartView: View {
   @StateObject var viewModel: CartViewModel
    var body: some View {
        VStack {
            List(viewModel.positions ) { position in
                PositionCell(position: position )
                    .swipeActions {
                    Button{
                        print("remove")
                        
                        viewModel.positions.removeAll { pos in
                            pos.id == position.id
                        }
                    } label: {
                         Text("Remove")
                        
                    }.tint(.red)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Shopping cart")
            HStack {
                Text("Summary:")
                Spacer()
                Text("\(viewModel.cost) $")
            }
            .fontWeight(.bold)
            .padding()
            HStack(spacing: 24 ) {
                Button{
                   print("cancel")
                } label: {
                     Text("Cancel")
                        .font(.body.weight(.bold))
                        .padding()
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(24)
                        
                }
                Button{
                   print("order")
                    var order = Order(userId: AuthService.shared.currentUser!.uid,
                                  date: Date(),
                                      status: OrderStatus.new.rawValue)
                    order.positions = self.viewModel.positions
                    DatabaseService.shared.setOrder(order: order) { result in
                        switch result {
                        case .success(let order):
                            print(order.cost)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    
                } label: {
                     Text("Order")
                        .font(.body.weight(.bold))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.green)
                        .cornerRadius(24)
                }
            }
            
        }
    }
}
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel.shared)
    }
}
