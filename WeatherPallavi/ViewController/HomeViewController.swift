//
//  HomeViewController.swift
//  WeatherPallavi
//
//  Created by Pallavi A on 2021/02/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var forecastTableView: UITableView!
   // @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var  weatherImage : UIImageView!
    @IBOutlet weak var  temperatureLabel : UILabel!
    @IBOutlet weak var  weatherConditionLabel : UILabel!
    
    
    fileprivate var viewModel: ForecastViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ForecastViewModel()
        self.setupView()
    }
    
    private func setupView() {
        forecastTableView.rowHeight = UITableView.automaticDimension
        forecastTableView.rowHeight = 120
        forecastTableView.register(UINib.init(nibName: NibFile.dayTableViewCell, bundle: nil), forCellReuseIdentifier: CellIdentifiers.dayTableViewCell)
        NotificationCenter.default.addObserver(self, selector: #selector(loadForecastData), name: NSNotification.Name(rawValue: "updateForecastData"), object: nil)
    }
    
    @objc func loadForecastData() {
        temperatureLabel.text = viewModel?.daysForecast[0].weatherForecast[0].temperature
        weatherConditionLabel.text = viewModel?.daysForecast[0].weatherForecast[0].weatherCondition
        
       
      
        if (weatherConditionLabel.text == "Rain") {
            weatherImage.image = .rainyImage
            forecastTableView.backgroundColor = .rainyColor
            
        } else if (weatherConditionLabel.text == "Clouds") {
            weatherImage.image = .cloudyImage
            forecastTableView.backgroundColor = .cloudyColor
        }else {
            weatherImage.image = .sunnyImage
            forecastTableView.backgroundColor = .sunnyColor
        }

        
        
        
        self.forecastTableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfRows = viewModel?.daysForecast.count else { return 0   }
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = forecastTableView.dequeueReusableCell(withIdentifier: CellIdentifiers.dayTableViewCell) as? DayTableViewCell {
            cell.viewModel = viewModel?.daysForecast[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

