//
//  LoginPage.swift
//  ThisPlateJoy
//
//  Created by Hanasrullah Halim on 14/08/2024.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: AuthViewModel
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            if let errorModel = viewModel.error{
                Text(errorModel.localizedDescription).font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(.red)
            }else
            if(viewModel.authState == .loggedOut){
                Text("My Recipe is Here!").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
            }else if(viewModel.authState == .loggingIn){
                Text("Loading..").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(.blue)
                
            }
            
            
            else{
                Text("OLA!").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
            }
            TextField("Username", text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)
            CustomTextButton(action: {
                viewModel.signIn(email: username, password: password)
            }, label: "Log In", backgroundColor: Color.blue)
            CustomTextButton(action: {
                viewModel.signOut()
            }, label: "Sign up", backgroundColor: Color.brown)
        }
        .padding()
    }
}


// PreviewProvider for LoginView
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: AuthViewModel())
    }
}
