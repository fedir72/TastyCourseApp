//
//  MainTabViewModel.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 25.11.2022.
//

import Foundation
import FirebaseAuth

class MainTabViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
