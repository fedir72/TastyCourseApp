//
//  ProductDetailView.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 19.11.2022.
//

import SwiftUI

struct ProductDetailView: View {
    
    var viewModel: ProductDetailModelView
    @State var size = "small"
    @State var count = 1
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Image("tea")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity,maxHeight: 250)
                
                
                HStack {
                    Text("Product \(viewModel.product.title)")
                        .font(.title.bold())
                    Spacer()
                    Text("\(viewModel.getPrice(size: self.size))")
                        .font(.title)
                }
                .padding(.horizontal, 20)
                
                Text("\(viewModel.product.descript)")
                    .padding(20)
                HStack {
                    Stepper("количество", value: $count , in: 1...10)
                    Text("\(self.count)")
                        .padding(.leading)
                }
                .padding(.horizontal,20)
                Picker("pizzas sizes",
                       selection: $size) {
                    ForEach(viewModel.sizes, id: \.self) { size in
                        Text(size)
                    }
                }.pickerStyle(.segmented)
                    .padding()
                Spacer()
            }
            Button{
                var position = Position(id: UUID().uuidString,
                                        product: viewModel.product,
                                        count: count)
                position.product.price = viewModel.getPrice(size: self.size)
                CartViewModel.shared.addPosition(position)
                presentationMode.wrappedValue.dismiss()
            }label: {
                Text("Add to cart")
                    .font(.title2.smallCaps())
                    .padding()
                    .foregroundColor(.black)
                    .background(LinearGradient(colors: [.orange, .yellow],
                                               startPoint: .leading,
                                               endPoint: .trailing))
                    .cornerRadius(30)
                
            }
            Spacer()
      
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let prod = Product(id: "6",
                           title: "big set",
                           imageUrl: "Not pizza",
                           price: 10,
                           descript: "In that sense, a publisher is somewhat similar to a Swift iterator. One very valuable difference is that a Publisher’s completion could be either successful or a failure, and also that you need to actively pull values from an iterator, while a Publisher pushes values to its consumers."
//                           ordersCount: 3,
//                           isRecommend: true
        )
        ProductDetailView(viewModel: ProductDetailModelView(product: prod))
    }
}
