//
//  DayModel.swift
//  WeatherPallavi
//
//  Created by Pallavi A on 2021/02/22.
//

import UIKit

class DayModel: NSObject {
    
    var forecastDate: String
    var forecastTime: String
    var weatherList: [WeatherModel]
    
    init(forecastDate: String, forecastTime: String, weatherList: [WeatherModel]) {
        self.forecastDate = forecastDate
        self.forecastTime = forecastTime
        self.weatherList  = weatherList
    }
}
