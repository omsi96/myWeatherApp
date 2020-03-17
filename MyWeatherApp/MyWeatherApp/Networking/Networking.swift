//
//  Networking.swift
//  MyWeatherApp
//
//  Created by Omar Alibrahim on 1/24/20.
//  Copyright © 2020 Omsi. All rights reserved.
//

import Foundation




class Weather
{
    private let x_api_key = "45f2bda7099806a549c31b6e07146434"
    private let apiPath = "https://api.openweathermap.org/data/2.5/weather?q="
    
    func requestWeatherFor(city: String, closure: @escaping(Forecast?)->())
    {
        let path = apiPath + (city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")
        guard let url = URL(string: path) else {
            fatalError("MAYBE THE URL CONTAINS SOMETHING WRONG, LIKE SPACES FOR EXAMPLE")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue(x_api_key, forHTTPHeaderField: "x-api-key")
        URLSession.shared.dataTask(with: urlRequest){ data, response, error in
                
            guard let data = data else {
                print("THERE IS NO DATA FOUND")
                DispatchQueue.main.async {
                    closure(nil)
                }
                return
            }
            guard let response = response else{
                print("THERE IS NO RESPONSE FOUND!")
                DispatchQueue.main.async {
                    closure(nil)
                }
                return
            }
            if let error = error
            {
                print("There is an error!", error)
                DispatchQueue.main.async {
                    closure(nil)
                }
                return
            }
            
            guard (response as! HTTPURLResponse).statusCode == 200 else
            {
                print("CODE IS WRONG!", response)
                DispatchQueue.main.async {
                    closure(nil)
                }
                return
            }
            do{
                let decodedData = try JSONDecoder().decode(Forecast.self, from: data)
                
                DispatchQueue.main.async {
                    closure(decodedData)
                }
                
            }catch{
                print("couldn't decode data with the following error:", error)
                DispatchQueue.main.async {
                    closure(nil)
                }
                return
            }
        }.resume()
        
    }
}
