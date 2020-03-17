//
//  ViewController.swift
//  MyWeatherApp
//
//  Created by Omar Alibrahim on 1/24/20.
//  Copyright © 2020 Omsi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tempratureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Here is the function call we make in order to get forecast from the internet. Just change the parameter into any other country, and it will request your order and give you back the temprature!
        
        let city = "london"
        // You can try changing it to Kuwait/ mecca/ toronto, paris, or any valid city name
        
        Weather().requestWeatherFor(city: city) { forecast in
            
            
            
            // Here you get forecast as a variable that holds the temprature
            let tempInK = forecast!.main.temp
            let tempInC = (tempInK - 272.15).rounded(.down)
            self.tempratureLabel.text = "\(tempInC)ºC"
            self.cityLabel.text = city

        }
        
        
    }


}

