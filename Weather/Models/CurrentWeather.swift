//
//  CurrentWeather.swift
//  Weather
//
//  Created by Кирилл Шишкин on 13.04.2021.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    
    let feelsLikeTemp: Double
    var feelsLikeTempString: String {
        return String(format: "%.0f", feelsLikeTemp)
    }
    
    let confitionCode: Int
    var systemIconNameString: String {
        switch confitionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.min.fill"
        case 801...804: return "cloud.fill"
        default: return "nosign"
        }
    }
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemp = currentWeatherData.main.feelsLike
        confitionCode = currentWeatherData.weather.first!.id
    }
}
