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
    
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
//  IB OUTLETS
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    // global vars
    // dicttionary with times in seconds
    let eggTimes = ["Soft": 3, "Medium": 420, "Hard": 720]
//    var totalTime = 0
    var secondsPassed : Float = 0.0
    var timer = Timer()
    var player: AVAudioPlayer?
    

  
//  IB ACTIONS
    @IBAction func hardnessSelected(_ sender: UIButton) {
//        print(mainTitle.text)
//        print(progressBar.progress)
  
//        print("This is the type of egg : \(sender.currentTitle)")
        let hardness = sender.currentTitle!
        
        progressBar.progress = 0.0
        secondsPassed = 0.0
        mainTitle.text = hardness
//        if hardness == "Soft" {
//            print("Cook time should be: \(softTime)")
//        }
//        if hardness == "Medium" {
//              print("Cook time should be: \(mediumTime)")
//          }
//        if hardness == "Hard" {
//              print("Cook time should be: \(hardTime)")
//          }
//        var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)

        
//        print(progressBar.progress)

        
        update(cookTime: Float(eggTimes[hardness]!))

        // one line solution
//        print(eggTimes[hardness]!)
    }
    
    func update( cookTime: Float) {
//        var count = 0
//         count = cookTime

        
       

        timer.invalidate()
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {  (Timer) in
//            if count > 0 {
//                print ("\(count) seconds")
//                count -= 1
//            } else {
//                Timer.invalidate()
//                self.mainTitle.text = "DONE!"
//
//            }
//        }
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {  (Timer) in
            if self.secondsPassed < cookTime {
                self.secondsPassed += 1
                print ("\(self.secondsPassed) seconds")
                let percentageProgress = self.secondsPassed / cookTime
                print(percentageProgress)
                self.progressBar.progress = Float(percentageProgress)
                print("this is the number after the float: \(Float(percentageProgress))")
            } else {
                Timer.invalidate()
                // extra check to ensure once timer is up the progress bar always goes to 100
                self.progressBar.progress = 1.0
                self.playSound()
                self.mainTitle.text = "DONE!"
                
               
            }
        }
        
//        print(count)
    }
     
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
