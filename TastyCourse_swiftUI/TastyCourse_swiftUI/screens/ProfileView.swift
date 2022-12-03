//
//  ProfileView.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 18.11.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAvaAlertPresent = false
    @State var isQuiteAlertPresent = false
    @State var isAuthViewPresented = false
    
    @StateObject var viewModel: ProfileViewModel
    
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Image("man")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .padding()
                    .aspectRatio(contentMode: .fit)
                    .background(Color.yellow)
                    .clipShape(Circle())
                    .onTapGesture {
                        isAvaAlertPresent.toggle()
                    }
                    .confirmationDialog("where take a profile photo",
                                        isPresented: $isAvaAlertPresent) {
                        Button {
                            
                        } label: {
                            Text("Library")
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Gallery")
                        }
                        
                        Button {
                            
                        } label: {
                            Text("From camera")
                        }
                      
                    }
                VStack(alignment: .trailing) {
                    TextField("Name",text: $viewModel.profile.name )
                        .font(.body.bold())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    HStack {
                        Text("+38")
                        TextField("Phone",
                                  value: $viewModel.profile.phone,
                                  format: .number)
                    }
                }
            }
            VStack(alignment: .leading,spacing:5){
                Text("Delivery adress:")
                    .font(.title2.bold())
                TextField("Your adress", text: $viewModel.profile.adress)
                    .font(.title2.weight(.medium))
            }
            .padding(.horizontal, 20)
            List {
                if viewModel.orders.count == 0 {
                    Text("your orders will be here")
                } else {
                    ForEach(viewModel.orders, id: \.id) { order in
                        OrderCell(order: order)
                    }
                }
            }
            .listStyle(.plain)
            
            Button{
                isQuiteAlertPresent.toggle()
            } label: {
               Text("go out")
                    .padding()
                    .padding(.horizontal, 30)
                    .background(Color.red)
                    .cornerRadius(30)
                    .tint(.white)
                    .padding(.bottom,20)
            }
            .confirmationDialog("You shure wanna go out?",
                                isPresented: $isQuiteAlertPresent) {
                Button {
                    isAuthViewPresented.toggle()
                } label: {
                    Text("Yes i do")
                }
                
            }
            .fullScreenCover(isPresented: $isAuthViewPresented,onDismiss: nil) {
                AuthView()
             }
            
        }
        //close keyboard button(return)
        .onSubmit {
              print("on submit")
            viewModel.setProfile()
         }
        .onAppear {
            self.viewModel.getProfile()
            self.viewModel.getOrders()
        }
        
        
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        let user = MVUser(id: "lkdfjfjfvnmvjgj", name: "some name",
//                          phone: 1234567,
//                          adress: "fuck off your adress")
//        ProfileView(viewModel: ProfileViewModel(profile: user))
//    }
//}
