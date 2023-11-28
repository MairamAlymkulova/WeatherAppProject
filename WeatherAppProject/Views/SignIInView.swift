//
//  SignIInView.swift
//  WeatherAppProject
//
//  Created by A Mairam on 28/11/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @Binding var isLogedIn: Bool
    
    var body: some View {
        
        
        VStack{
            Text("Sign In")
                .font(.title).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextFieldUI(
                label: "Email",
                exampleText: "example@gmail.com",
                value: $email
            )
            TextFieldUI(
                label: "Password",
                exampleText: "password123",
                value: $password,
                isPassword: true
            )
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Forgot password?")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.black)
                    .padding()
            })
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Button(action: {
                Auth.auth().signIn(
                    withEmail: email,
                    password: password
                ) { authResult, error in
                    // ...
                    if let authResult{
                        isLogedIn = true
                    }else{
                        print("errrrrr \(error)")
                    }
                }
            }, label: {
                Image(systemName: "arrow.right")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .clipShape(Circle())
                    .shadow(color: .indigo, radius: 5)
                
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top)
            
        }
        
    }
}
