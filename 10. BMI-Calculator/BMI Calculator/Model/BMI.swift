//
//  BMI.swift
//  BMI Calculator
//
//  Created by Yevhenii Orlov on 15.02.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct BMI {
    
    let value: Float
    let advice: String
    let color: UIColor
    
    init(value: Float) {
        self.value = value
        
        switch value {
        case ..<18.4:
            advice = "Eat more pies!"
            color = UIColor.blue
        case ..<24.9:
            advice = "Fit as a fiddle! "
            color = UIColor.green
        default:
            advice = "Eat less pies!"
            color = UIColor.red
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", value)
    }
}
