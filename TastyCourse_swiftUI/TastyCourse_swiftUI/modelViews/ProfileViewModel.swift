//
//  ProfileViewModel.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 27.11.2022.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var profile: MVUser
    @Published var orders: [Order] = []
    
    init(profile: MVUser) {
        self.profile = profile
    }
    
    func getOrders() {
        DatabaseService.shared.getOrders(by: AuthService.shared.currentUser!.accessibilityHint) { result in
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
                
                
                print("count of orders: \(orders.count)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setProfile() {
        DatabaseService
        .shared
        .setProfile(user: self.profile) { result in
            switch result {
            case .success(let user):
                print(user.name)
            case .failure(let error):
                print("set user error \(error.localizedDescription)")
            }
        }
    }
    func getProfile() {
        DatabaseService.shared.getProfile { result in
            switch result {
            case .success(let user):
                self.profile = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
