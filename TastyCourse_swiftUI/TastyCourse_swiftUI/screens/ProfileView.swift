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
                    Text("Fedii Ihor Ivanovich")
                        .font(.title2.bold())
                    Text("+38099234567")
                }
            }
            VStack(alignment: .leading,spacing:5){
                Text("Delivery adress:")
                    .font(.title2.bold())
                Text("Ukraine, kharkiv region, Kharkiv, Sumskaya str, build n.23")
                    .font(.title2.weight(.medium))
            }
            List {
                Text("your orders will be here")
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
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
