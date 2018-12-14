//
//  APIKeys.swift
//  Tempest
//
//  Created by Matthew Riley on 10/25/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import Foundation

//Struct to contain our API keys from the DarkSky API and the Google Geocoding API
struct APIKeys {
    let darkSkyKey = "d1e2d95204dcb963bb733357b2a25b61"
    //Example DarkSky request:
    //https://api.darksky.net/forecast/ + API Key + / + Latitude + Longitude
    
    let googleKey = "AIzaSyCPTI9AQ-ApTK4KdHZv-H69URe2_-nFPzQ"
    //Example Geocoding request:
    //https://maps.googleapis.com/maps/api/geocode/json?address= + Address + &key= + API Key
}


//My googleKey: AIzaSyBjgLu_YQ55KiWLEB693HV12-y1cSxS734

