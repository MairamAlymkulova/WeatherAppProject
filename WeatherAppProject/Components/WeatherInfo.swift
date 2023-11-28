//
//  WeatherInfo.swift
//  WeatherAppProject
//
//  Created by A Mairam on 28/11/23.
//

import SwiftUI

struct WeatherInfo: View {
    let weather: ResponseBody
    var body: some View {
        let formattedDate = dateFormatter(timeZone: weather.timezone)
        ZStack{
            VStack(alignment: .leading, spacing: 5) {
                Text(weather.name)
                    .bold().font(.title)
                
                Text("Today, \(formattedDate)")
                    .fontWeight(.light)
                
                VStack(alignment: .center, spacing: 20) {
                    HStack{
                        Text("\(Int(weather.main.temp))°")
                            .font(.system(size: 45, weight: .semibold))
                        Spacer()

                        VStack(alignment: .trailing){
                            
                            Text("\(weather.weather[0].main)")
                                .font(.system(size: 20, weight: .semibold))
                            
                            
                            Text("Feels like \(Int(weather.main.feelsLike))°")
                                .font(.system(size: 20, weight: .semibold))
                        }

                    }
                    
                    HStack(spacing: 20){
                        Text("H: \(Int(weather.main.tempMax))°")
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("L: \(Int(weather.main.tempMin))°")
                            .font(.system(size: 20, weight: .semibold))
                        
                    }
                    
                }
                .frame(minWidth: UIScreen.main.bounds.width - 30)
                .padding(.vertical, 40)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private func dateFormatter(timeZone: Int) -> String {
    
    let formatter = DateFormatter()
    let tZ = TimeZone(secondsFromGMT: timeZone)
    formatter.dateFormat = "dd MMM HH:mm"
    formatter.timeZone = tZ
    
    return formatter.string(from: Date())
}
