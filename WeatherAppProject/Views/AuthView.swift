//
//  AuthView.swift
//  WeatherAppProject
//
//  Created by A Mairam on 28/11/23.
//

import SwiftUI

struct AuthView: View {
    @State private var showSignUp = false
    @Binding var isLogedIn: Bool
    var body: some View {
        VStack{
            Circles()
            ZStack{
                if showSignUp{
                    SignUpView(showSignUP: $showSignUp)
                        .transition(MoveTransition(edge: .leading))
                }else{
                    SignInView(isLogedIn: $isLogedIn)
                        .transition(MoveTransition(edge: .leading))
                }
            }
            .padding()
            .padding(.top, -UIScreen.main.bounds.height/4)
            .frame(maxHeight: .infinity, alignment: .top)
            
            
            .overlay(alignment: .bottom){
                HStack{
                    Text(showSignUp ? "Alredy have an account?" : "Create account?")
                        .fontWeight(.bold)
                    
                    
                    Button(action: {
                        withAnimation {
                            showSignUp.toggle()
                        }
                    }, label: {
                        Text(showSignUp ? "Sign In" : "Sign Up")
                            .fontWeight(.bold)
                            .foregroundColor(.indigo)
                    })
                }
            }
        }
    }
}

