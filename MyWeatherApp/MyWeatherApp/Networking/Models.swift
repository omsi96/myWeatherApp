//
//  Models.swift
//  MyWeatherApp
//
//  Created by Omar Alibrahim on 1/24/20.
//  Copyright © 2020 Omsi. All rights reserved.
//

import Foundation

struct Coord: Codable{
    var lon: Double
    var lat: Double
}

struct Wheather: Codable
{
    var id: Int
    var main: String
    var description: String
}

struct MainWheather: Codable{
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Int
    var humidity: Int
}

struct Forecast: Codable{
    var coord: Coord
    var weather: [Wheather]
    var main: MainWheather
}


