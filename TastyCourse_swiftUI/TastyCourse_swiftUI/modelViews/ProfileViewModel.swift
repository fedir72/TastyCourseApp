//
//  ProfileViewModel.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 27.11.2022.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var profile: MVUser
    
    init(profile: MVUser) {
        self.profile = profile
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
