//
//  WeatherModel.swift
//  WeatherPallavi
//
//  Created by Pallavi A on 2021/02/22.
//


import Foundation

class WeatherModel: NSObject {
    
    var temperature: Double
    var weatherCondition: String
    
    init(temperature: Double, weatherCondition: String) {
        self.temperature      = temperature
        self.weatherCondition = weatherCondition
    }
}

