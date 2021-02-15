//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain: CalculatorBrain?
    
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func moveHeightSlider(_ sender: UISlider) {
        let height = String(format: "%.1f", sender.value)
        heightValue.text = height + "m"
    }
    
    @IBAction func moveWeightSlider(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightValue.text = weight + "Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain = CalculatorBrain(height: heightSlider.value, weight: weightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = String(format: "%.1f", calculatorBrain!.bmi.value)
            destinationVC.advice = calculatorBrain!.bmi.advice
            destinationVC.color = calculatorBrain!.bmi.color
        }
    }
}

