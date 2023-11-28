//
//  WeatherParametrsCard.swift
//  WeatherAppProject
//
//  Created by A Mairam on 28/11/23.
//

import SwiftUI

struct WeatherParametrsCard: View {
    let paramentrName: String
    let img: String
    let parametrValue: String
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack(alignment: .leading, spacing: 10){
                Text(paramentrName)
                    .font(.system(size: 15, weight: .medium))
                    .lineLimit(.none)
                    .fixedSize(horizontal: false, vertical: true)
                
                Image(systemName: img)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                
                Text(parametrValue)
                    .font(.system(size: 20, weight: .semibold))
                
            }
            .frame(width: UIScreen.main.bounds.width/2 - 60, height: 150)
            
        }
        .padding()
        .background(.bar)
        .cornerRadius(20)
        .foregroundColor(.blue)
    }
    
}


struct ParametrsView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherParametrsCard(paramentrName: "Макс. скорость ветра", img: "cloud", parametrValue: "37 km/h")
    }
}
