//
//  CartViewModel.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 19.11.2022.
//

import Foundation

class CartViewModel: ObservableObject {
    
    static let shared = CartViewModel()
    private init() {}
  
    @Published var positions = [Position]()
    
    var cost: Int {
        return positions.reduce(0) { return $0+$1.cost }
    }
    
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
    
}
