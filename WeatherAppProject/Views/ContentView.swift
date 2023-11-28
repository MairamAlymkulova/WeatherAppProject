//
//  ContentView.swift
//  WeatherAppProject
//
//  Created by A Mairam on 28/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isLogedIn = false
    var body: some View {
        NavigationStack {
            if isLogedIn {
                WeatherView(logedIn: $isLogedIn)
                    .transition(MoveTransition(edge: .leading))
                
            }else{
                AuthView(isLogedIn: $isLogedIn)
                    .transition(MoveTransition(edge: .leading))
            }
        }
    }
}
