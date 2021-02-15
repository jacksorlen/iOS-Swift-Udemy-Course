import Foundation

struct CalculatorBrain {
    
    var bmi: BMI
    
    init(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        self.bmi = BMI(value: bmiValue)
    }
}
