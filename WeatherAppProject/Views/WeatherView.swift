//
//  WeatherView.swift
//  WeatherAppProject
//
//  Created by A Mairam on 28/11/23.
//


import SwiftUI

struct WeatherView: View {
    
    @State private var weather: ResponseBody? = nil
    private let manager = WeatherManager()
    @State private var city: String = ""
    @Binding var logedIn: Bool
    
    var body: some View {

            ScrollView {
                HStack(alignment: .center, spacing: 10){
                    LogoutBtn(logedIn: $logedIn)
                        .padding(.leading)

                    ZStack(alignment: .trailing){
                        
                        TextField("City name", text: $city)
                            .font(.system(size: 25, weight: .semibold))
                            .foregroundColor(.black)
                            .padding()
                        
                        Button(action: {
                            manager.getCurrentWeather(city: city) { weatherData in
                                if let weatherData = weatherData {
                                    self.weather = weatherData
                                } else {
                                    print("Failed to get weather data. Error")
                                }
                            }
                        }, label: {
                            Image(systemName: "magnifyingglass.circle.fill")
                                .font(.system(size: 50, weight: .bold))
                        })
                    }
                    .frame(maxWidth: .infinity)
                    .background(.white).opacity(0.6)
                    .cornerRadius(30)
                    .padding(.trailing)
                }
                if let weather = weather {
                    VStack{
                        
                        WeatherInfo(weather: weather)
                        VStack{
                            HStack(alignment: .top, spacing: 20){
                                
                                WeatherParametrsCard(
                                    paramentrName: "Макc. скорость ветра",
                                    img: "wind",
                                    parametrValue: "\(Int(weather.wind.speed)) км/ч")
                                WeatherParametrsCard(
                                    paramentrName: "Средняя влажность",
                                    img: "humidity",
                                    parametrValue: "\(Int(weather.main.humidity)) %")
                            }
                            
                            HStack(alignment: .top, spacing: 20){
                                
                                WeatherParametrsCard(
                                    paramentrName: "Осадки",
                                    img: "cloud",
                                    parametrValue: "\(Int(weather.clouds.all)) %")
                                WeatherParametrsCard(
                                    paramentrName: "Давление",
                                    img: "arrow.down.and.line.horizontal.and.arrow.up",
                                    parametrValue: "\(Int(weather.main.pressure)) hPa")
                            }
                        }
                        
                    }
                    Spacer()
                }
                
            }
            
            .frame( maxWidth: .infinity, maxHeight: .infinity)
            .background(.blue)
            .foregroundColor(.white)

    }
    
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
