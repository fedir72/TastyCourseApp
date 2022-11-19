//
//  CatalogueView.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 18.11.2022.
//

import SwiftUI

struct CatalogueView: View {
    let layout = [GridItem(.adaptive(minimum: screen.width/2.2))]
    var body: some View {
        NavigationView {
            
        ScrollView(.vertical, showsIndicators: true) {
            Section("Popular") {
                ScrollView(.horizontal, showsIndicators: true) {
                    LazyHGrid(rows: layout) {
                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id) { item in
                            NavigationLink {
                                let viewModel = ProductDetailModelView(product: item)
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                            }
                        }
                    }
                }
            }
            
            Section("Pizzas") {
                ScrollView(.vertical, showsIndicators: true) {
                    LazyVGrid(columns: layout) {
                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id) { item in
                            NavigationLink {
                                let viewModel = ProductDetailModelView(product: item)
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                            }
                        }
                    }
                }
            }
        }
        //.navigationBarHidden(true)
        .navigationTitle("Catalogue")
        }
    }
    
}

struct CatalogueView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogueView()
    }
}
