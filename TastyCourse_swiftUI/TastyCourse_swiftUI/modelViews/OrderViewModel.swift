//
//  OrderViewModel.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 03.12.2022.
//

import Foundation

class OrderViewModel: ObservableObject {
   
    @Published var order: Order
    @Published var user = MVUser(id: "", name: "", phone: 0, adress: "")
    
    init(order: Order) {
        self.order = order
    }
    
    func getUserData() {
        DatabaseService.shared.getProfile(by: order.userId) { result in
            switch result {
            case .success(let user):
                self.user = user
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
        
}
