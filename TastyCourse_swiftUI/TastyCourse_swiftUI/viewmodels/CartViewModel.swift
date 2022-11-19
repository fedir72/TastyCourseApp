//
//  CartViewModel.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 19.11.2022.
//

import Foundation

class CartViewModel: ObservableObject {
  
    @Published var positions = [Position]()
    
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
}
