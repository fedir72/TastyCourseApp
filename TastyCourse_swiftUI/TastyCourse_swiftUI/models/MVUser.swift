//
//  MVUser.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 27.11.2022.
//

import Foundation

struct MVUser: Identifiable {
    var id: String
    var name: String
    var phone: Int
    var adress: String
   
    var representation: [String:Any] {
        return [
            "id": self.id,
            "name": self.name,
            "phone": self.phone,
            "adress": self.adress
        ]
    }
}
