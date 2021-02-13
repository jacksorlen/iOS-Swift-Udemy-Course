//
//  QuizzeBrain.swift
//  Quizzler-iOS13
//
//  Created by Yevhenii Orlov on 13.02.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    let quiz = [
        Question(text: "Four + Two is equal to Six.", answer: "True"),
        Question(text: "Sun is the black hole.", answer: "False"),
        Question(text: "Fender makes Les Pauls.", answer: "False"),
        Question(text: "Avon is the company for woomans.", answer: "True"),
        Question(text: "London is the capital of GB.", answer: "True"),
        Question(text: "A slug's blood is green.", answer: "True"),
        Question(text: "Approximately one quarter of human bones are in the feet.", answer: "True"),
        Question(text: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
        Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
        Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
        Question(text: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
        Question(text: "You can lead a cow down stairs but not up stairs.", answer: "False"),
        Question(text: "Google was originally called 'Backrub'.", answer: "True"),
        Question(text: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
        Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
        Question(text: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
        Question(text: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")

    ]
    
    var currentQuestionNumber = 0
    var score = 0
    
    mutating func checkUserAnswer(answer: String) -> Bool {
        if answer == quiz[currentQuestionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getCurrentQuestion() -> Question {
        return quiz[currentQuestionNumber]
    }
    
    func getProgress() -> Float {
        return Float(currentQuestionNumber + 1) / Float(quiz.count)
    }
    
    mutating func nextQuestion(){
        if currentQuestionNumber + 1 < quiz.count {
            currentQuestionNumber += 1
        } else {
            currentQuestionNumber = 0
            score = 0 
        }
    }
}
