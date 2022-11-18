//
//  ContentView.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 17.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAuth = true
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
//            ZStack {
//                Image("pizza")
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .blur(radius: isAuth ? 0 : 12)
                
                VStack(spacing: 30) {
                    Text(isAuth ? "Authorisation" : "Registration")
                        .padding(isAuth ? 16 : 24)
                        .padding(.horizontal, 30)
                        .font(.title2.bold())
                        .background(Color("whiteAlpha"))
                        .cornerRadius(isAuth ? 30 : 60 )
                    
                    VStack {
                        TextField("Enter email", text: $email)
                            .padding()
                            .background(Color("whiteAlpha"))
                            .cornerRadius(12)
                            .padding(5)
                            .padding(.horizontal,12)
                        SecureField("Enter password", text: $password)
                            .padding()
                            .background(Color("whiteAlpha"))
                            .cornerRadius(12)
                            .padding(5)
                            .padding(.horizontal,12)
                        if !isAuth {
                            SecureField("repeat password", text: $confirmPassword)
                                .padding()
                                .background(Color("whiteAlpha"))
                                .cornerRadius(12)
                                .padding(5)
                            .padding(.horizontal,12)                }
                        
                        
                        Button{
                            if isAuth {
                                print("authorization")
                            } else {
                                print("registration")
                            }
                        } label: {
                            Text(isAuth ? "Войти" : "Registration")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [
                            Color("yellow"),Color("orange")
                        ], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                        .padding(5)
                        .padding(.horizontal,12)
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        
                        Button{
                            isAuth.toggle()
                            
                        } label: {
                            Text(isAuth ? "еще не с нами?" : "Уже есть аккаунт")
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                        .padding(5)
                        .padding(.horizontal,12)
                        .font(.title3.bold())
                        .foregroundColor(Color(.brown))
                    }
                    .padding()
                    .background(Color("whiteAlpha"))
                    .cornerRadius(24)
                    .padding(isAuth ? 20 : 10)
                    
                    .padding(.vertical)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                          Image("pizza").blur(radius: isAuth ? 0 : 12 )
                          .ignoresSafeArea())
                .animation(.easeInOut(duration: 0.5), value: isAuth)
                
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
