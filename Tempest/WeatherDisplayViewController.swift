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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //When the screen first loads, set the default values for the UI
        setupDefaultUI()
        
        let apiKeys = APIKeys()
        
        let darkSkyURL = "https://api.darksky.net/forecast/"
        let darkSkyKey = apiKeys.darkSkyKey
        let latitude = "37.8267"
        let longitude = "-122.4233"
        
        let url = darkSkyURL + darkSkyKey + "/" + latitude + "," + longitude
        
        let request = Alamofire.request(url)
        
        //Carrying out our Request
        request.responseJSON { response in
            //Switching based on the Result of the Request
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let googleBaseURL = "https://maps.googleapis.com/maps/api/geocode/json?address="
        let googleRequestURL = googleBaseURL + "Chicago,+Illinois" + "&key=" + apiKeys.googleKey
        
        let googleRequest = Alamofire.request(googleRequestURL)
        
        googleRequest.responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //This function will give the UI some default values whenever we first load the app...
    func setupDefaultUI() {
        locationLabel.text = "Wakanda, Africa"
        iconLabel.text = "🌍"
        currentTemperatureLabel.text = "Enter a location"
        highTemperatureLabel.text = "Black"
        lowTemperatureLabel.text = "Panther"
    }
}

