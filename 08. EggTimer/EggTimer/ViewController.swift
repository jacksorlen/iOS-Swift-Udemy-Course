//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progresBar: UIProgressView!
    
    let eggTimes: [String : Int] = ["Soft" : 5, "Medium" : 7, "Hard" : 12]
    var timer = Timer()
    var totalTime = 0
    var secondsRemaining = 0
    
    @IBAction func selectEgg(_ sender: UIButton) {
        invalidateState()
        totalTime = eggTimes[sender.currentTitle!]!
        
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(update),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func update() {
        if secondsRemaining <= totalTime {
            secondsRemaining += 1
            progresBar.progress =
                Float(secondsRemaining) / Float(totalTime)
        } else {
            titleLabel.text = "Done!"
            playAlarm()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.titleLabel.text = "How do you like your eggs?"
                self.invalidateState()
            }
        }
    }
    
    func invalidateState() {
        timer.invalidate()
        totalTime = 0
        secondsRemaining = 0
        progresBar.progress = 0.0
    }
    
    func playAlarm() {
        let soundUrl = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: soundUrl!)
        player.play()
    }
}
