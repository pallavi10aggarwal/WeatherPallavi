//
//  DayViewModel.swift
//  WeatherPallavi
//
//  Created by Pallavi A on 2021/02/22.
//


import UIKit

protocol DayViewModel {
    var dayModel: DayModel { get }
    var day: String { get }
    var weatherForecast: [WeatherViewModel] { get }
}

class DayViewModelMapper: NSObject, DayViewModel {
    
    var dayModel: DayModel
    var day: String
    var weatherForecast: [WeatherViewModel]
    
    init(dayModel: DayModel) {
        self.dayModel = dayModel
        self.day = ""
        self.weatherForecast = []
        super.init()
        self.setupViewData(dayModel: dayModel)
    }
    
    func setupViewData(dayModel: DayModel) {
        self.day = self.getDayOfWeek(dayModel.forecastDate)+", "+dayModel.forecastDate
        for weatherModel in self.dayModel.weatherList {
            self.weatherForecast.append(WeatherViewModelMapper(weather: weatherModel))
        }
    }
}

extension DayViewModelMapper {
    
    func getDayOfWeek(_ today:String) -> String {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let todayDate = formatter.date(from: today) else { return "" }
        let myCalendar = Calendar(identifier: .gregorian)
        
        NSLog("myCalendar \(myCalendar)")
        NSLog("todayDate \(todayDate)")
        
        let weekDay = myCalendar.component(.weekday, from: todayDate)
           
        NSLog("weekDay \(weekDay)")
        let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "EEEE"
                return dateFormatter.string(from:todayDate ).capitalized
        
       
//        return formatter.weekdaySymbols[myCalendar.component(.weekday, from: todayDate)]
    }
}
