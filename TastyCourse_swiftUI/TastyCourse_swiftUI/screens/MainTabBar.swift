//
//  MainTabBar.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 18.11.2022.
//

import SwiftUI
import FirebaseAuth

struct MainTabBar: View {
    
    var viewModel: MainTabViewModel
    
    var body: some View {
        TabView {
            CatalogueView()
                .tabItem {
                    Image(systemName: "list.number")
                    Text("catalogue")
                }
            CartView(viewModel: CartViewModel.shared)
                .tabItem {
                    Image(systemName: "cart")
                    Text("trash")
                }
            ProfileView(viewModel: ProfileViewModel(profile: MVUser(id: "lkdfjfjfvnmvjgj", name: "some name",
                                                                    phone: 1234567,
                                                                    adress: "fuck off your adress")))
           
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("profile")
                }
        }
    }
}

//struct MainTabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabBar(viewModel: MainTabViewModel(user: User()))
//    }
//}
