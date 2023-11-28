//
//  Circles.swift
//  WeatherAppProject
//
//  Created by A Mairam on 28/11/23.
//

import SwiftUI

struct Circles: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(.indigo)
                .offset(x: UIScreen.main.bounds.width/2, y: -UIScreen.main.bounds.height/5)
            Circle()
                .fill(.black)
                .offset(y: -UIScreen.main.bounds.height/4)
            Circle()
                .fill(.indigo)
                .offset(x: -UIScreen.main.bounds.width/2, y: -UIScreen.main.bounds.height/4)
            
        }
        .frame(maxHeight: UIScreen.main.bounds.width)
    }
}
