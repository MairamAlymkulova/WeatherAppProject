//
//  WeatherManager.swift
//  WeatherAppProject
//
//  Created by A Mairam on 28/11/23.
//
import Foundation
class WeatherManager{
    static var shared = WeatherManager()
    func getCurrentWeather(city: String, conclution: @escaping (ResponseBody?) -> Void) {
        let request = URLRequest(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\("36d8df8644548330f78fa1c06a631bfc")&units=metric")!)
        
        var result: ResponseBody?
        let task = URLSession.shared.dataTask(with: request){data, response, error in
            if let data {
                result = try? JSONDecoder().decode(ResponseBody.self, from: data)
                conclution(result)
            }
            
        }
        task.resume()
        
    }
    
}
// MARK: - Welcome
struct ResponseBody: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}

