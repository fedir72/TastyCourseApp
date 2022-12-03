//
//  AdminOrdersViewModel.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 03.12.2022.
//

import Foundation

class AdminOrdersViewModel: ObservableObject {
    @Published var orders = [Order]()
    var currentOrder = Order(userId: "", date: Date(), status: "New")
    
    func getOreders() {
        DatabaseService.shared.getOrders(by: nil) { result in
            switch result {
            case .success(let orders):
                self.orders = orders
                for (index,order) in self.orders.enumerated() {
                    DatabaseService
                        .shared
                        .getPositions(by: order.id) { result in
                            switch result {
                            case .success(let positions):
                                self.orders[index].positions = positions
                                print(self.orders[index].positions)
                            case .failure(let err):
                                print(err.localizedDescription)
                            }
                        }
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
