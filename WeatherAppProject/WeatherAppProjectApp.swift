//
//  WeatherAppProjectApp.swift
//  WeatherAppProject
//
//  Created by A Mairam on 28/11/23.
//

import SwiftUI
import FirebaseCore

@main
struct WeatherAppProjectApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
