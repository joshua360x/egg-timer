//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    // dicttionary with times in seconds
    let eggTimes = ["Soft": 3, "Medium": 420, "Hard": 720]
//    var totalTime = 0
    var secondsPassed : Float = 0.0
    var timer = Timer()
    

  

    @IBAction func hardnessSelected(_ sender: UIButton) {
//        print(mainTitle.text)
//        print(progressBar.progress)
//        print("This is the type of egg : \(sender.currentTitle)")
        let hardness = sender.currentTitle!
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
                print ("\(self.secondsPassed) seconds")
                var percentageProgress = self.secondsPassed / cookTime
                print(percentageProgress)
                self.progressBar.progress = Float(percentageProgress)
                print("this is the number after the float: \(Float(percentageProgress))")
                self.secondsPassed += 1
            } else {
                Timer.invalidate()
                self.progressBar.progress = 1.0
                self.mainTitle.text = "DONE!"
               
            }
        }
        
//        print(count)
    }
     
    func typeOfEgg() {
        
    }
    
}
