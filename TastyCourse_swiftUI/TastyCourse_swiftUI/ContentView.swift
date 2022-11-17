//
//  ContentView.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 17.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack(spacing: 30) {
            Text("Authorisation")
                .padding()
                .padding(.horizontal, 30)
                .font(.title2.bold())
                .background(Color("whiteAlpha"))
                .cornerRadius(30)
            
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
                Button{
                    print("authorization")
                } label: {
                  Text("Log in")
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
                    print("Вы еще не с нами?")
                } label: {
                  Text("Вы еще не с нами?")
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
            .padding(20)
            
            //.padding(.vertical)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("pizza"))
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
