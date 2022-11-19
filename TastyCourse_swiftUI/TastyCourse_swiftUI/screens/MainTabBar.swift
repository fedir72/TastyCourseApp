//
//  MainTabBar.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 18.11.2022.
//

import SwiftUI

struct MainTabBar: View {
    var body: some View {
        TabView {
            CatalogueView()
                .tabItem {
                    Image(systemName: "list.number")
                    Text("catalogue")
                }
            CartView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("trash")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("profile")
                }
        }
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
