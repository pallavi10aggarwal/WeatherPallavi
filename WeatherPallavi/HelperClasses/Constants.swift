//
//  Constants.swift
//  WeatherPallavi
//
//  Created by Pallavi A on 2021/02/22.
//

import  UIKit
import  Foundation

enum CellIdentifiers {
    static let dayTableViewCell          = "DayTableViewCell"
    static let weatherCollectionViewCell = "WeatherCollectionViewCell"
}

enum NibFile {
    static let dayTableViewCell          = "DayTableViewCell"
    static let weatherCollectionViewCell = "WeatherCollectionViewCell"
}

extension UIImage{
    static let rainyImage = UIImage(named:"sea_rainy")
    static let cloudyImage = UIImage(named:"sea_cloudy")
    static let sunnyImage = UIImage(named:"sea_sunny")
}
extension UIColor {
 static let rainyColor = UIColor(hexString: "#57575D")
    static let cloudyColor = UIColor(hexString: "#54717A")
    static let sunnyColor = UIColor(hexString:  "#4A90E2")
    
   
}
extension UIColor {
//    convenience init(hex: Int, alpha: Double = 1.0) {
//        self.init(red: CGFloat((hex>>16)&0xFF)/255.0, green:CGFloat((hex>>8)&0xFF)/255.0, blue: CGFloat((hex)&0xFF)/255.0, alpha:  CGFloat(255 * alpha) / 255)
//    }
    
}
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
