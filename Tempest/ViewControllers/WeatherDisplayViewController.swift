//
//  WeatherDisplayViewController.swift
//  Tempest
//
//  Created by Matthew Riley on 10/24/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class WeatherDisplayViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var highTemperatureLabel: UILabel!
    @IBOutlet weak var lowTemperatureLabel: UILabel!
    
    var displayWeatherData: WeatherData! {
        didSet {
            iconLabel.text = displayWeatherData.condition.icon
            currentTemperatureLabel.text = "\(displayWeatherData.temperature)º"
            highTemperatureLabel.text = "\(displayWeatherData.highTemperature)º"
            lowTemperatureLabel.text = "\(displayWeatherData.lowTemperature)º"
        }
    }
    
    var displayGeocodingData: GeocodingData! {
        didSet {
            locationLabel.text = displayGeocodingData.formattedAddress
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //When the screen first loads, set the default values for the UI
        setupDefaultUI()
        
    }
    
    //This function will give the UI some default values whenever we first load the app
    func setupDefaultUI() {
        locationLabel.text = ""
        iconLabel.text = ""
        currentTemperatureLabel.text = "Enter a location"
        highTemperatureLabel.text = "-"
        lowTemperatureLabel.text = "-"
    }
    
    //Unwind action so that we can unwind to this screen after retrieving data
    @IBAction func unwindToWeatherDisplay(segue: UIStoryboardSegue) { }
}








//let apiKeys = APIKeys()
//
//let darkSkyURL = "https://api.darksky.net/forecast/"
//let darkSkyKey = apiKeys.darkSkyKey
//let latitude = "41.8781"
//let longitude = "-87.6298"
//
//let url = darkSkyURL + darkSkyKey + "/" + latitude + "," + longitude
//
//let request = Alamofire.request(url)
//
////Carrying out our Request
//request.responseJSON { response in
//    //Switching based on the Result of the Request
//    switch response.result {
//    case .success(let value):
//        //If our request succeeds, take the value and convert it into a JSON object
//        let json = JSON(value)
//        print(json)
//        let exampleWeatherData = WeatherData(json: json)
//        print(exampleWeatherData?.temperature)
//        print(exampleWeatherData?.highTemperature)
//        print(exampleWeatherData?.lowTemperature)
//        print(exampleWeatherData?.condition.icon)
//    case .failure(let error):
//        print(error.localizedDescription)
//    }
//}
//
//let googleBaseURL = "https://maps.googleapis.com/maps/api/geocode/json?address="
//let googleRequestURL = googleBaseURL + "Chicago,+Illinois" + "&key=" + apiKeys.googleKey
//
//let googleRequest = Alamofire.request(googleRequestURL)
//
//googleRequest.responseJSON { response in
//    switch response.result {
//    case .success(let value):
//        let json = JSON(value)
//        print(json)
//    case .failure(let error):
//        print(error.localizedDescription)
//    }
//}




