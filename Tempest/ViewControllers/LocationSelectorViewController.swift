//
//  LocationSelectorViewController.swift
//  Tempest
//
//  Created by Matthew Riley on 10/26/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import UIKit

class LocationSelectorViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var locationSearchBar: UISearchBar!
    
    //Instance of the API Manager class so we can make API calls on this screen
    let apiManager = APIManager()
    
    var geocodingData: GeocodingData?
    var weatherData: WeatherData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationSearchBar.delegate = self
        // Do any additional setup after loading the view.
    }
    
    //If something goes wrong with one of the API calls, call this to make sure we aren't holding on to any geocoding or weather data
    func handleError() {
        geocodingData = nil
        weatherData = nil
    }
    
    func retrieveGeocodingData(searchAddress: String) {
        apiManager.geocode(address: searchAddress) { (geocodingData, error) in
            //If we receive an error, print out the error's localized description, call the handleError function, and return
            if let receivedError = error {
                print(receivedError.localizedDescription)
                self.handleError()
                return
            }
            
            //If we received geocoding data, assign it to the geocodingData property and then make a Dark Sky call
            if let receivedData = geocodingData {
                self.geocodingData = receivedData
                //Use that data to make a Dark Sky call
                self.retrieveWeatherData(latitude: receivedData.latitude, longitude: receivedData.longitude)
            } else {
                self.handleError()
                return
            }
        }
    }
    
    func retrieveWeatherData(latitude: Double, longitude: Double) {
        apiManager.getWeather(latitude: latitude, longitude: longitude) { (weatherData, error) in
            if let receivedError = error {
                print(receivedError.localizedDescription)
                self.handleError()
                return
            }
            
            if let receivedData = weatherData {
                self.weatherData = receivedData
                self.performSegue(withIdentifier: "unwindToWeatherDisplay", sender: self)
            } else {
                self.handleError()
                return
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //Try to replace any spaces in the search bar text with + signs. If you can't, stop running the function
        guard let searchAddress = searchBar.text?.replacingOccurrences(of: " ", with: "+") else {
            return
        }
        retrieveGeocodingData(searchAddress: searchAddress)
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? WeatherDisplayViewController, let retrievedGeocodingData = geocodingData, let retrievedWeatherData = weatherData {
            destinationVC.displayGeocodingData = retrievedGeocodingData
            destinationVC.displayWeatherData = retrievedWeatherData
        }
    }
}











