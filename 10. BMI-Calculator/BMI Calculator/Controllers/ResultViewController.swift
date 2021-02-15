//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Yevhenii Orlov on 14.02.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var bmiValue: String?
    var advice: String?
    var color: UIColor?

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var massageLabel: UILabel!
    @IBOutlet weak var resultBackground: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = bmiValue
        massageLabel.text = advice
        resultBackground.backgroundColor = color
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
