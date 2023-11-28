//
//  LogoutBtn.swift
//  WeatherAppProject
//
//  Created by A Mairam on 28/11/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct LogoutBtn: View {
    @Binding var logedIn: Bool
    var body: some View {
        
        Button(action: {
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                logedIn = false
                
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
        }, label: {
            Image(systemName: "arrow.backward")
                .font(.title).bold()
                .foregroundColor(.white)
        })
        .padding()
        .background(.black)
        .clipShape(Circle())
        
    }
}

