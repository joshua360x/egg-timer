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
    
    // dicttionary
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
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
        
        update()
        

        // one line solution
        print(eggTimes[hardness])
    }
    
    func update() {
    var count = 60


        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if count > 0 {
                print ("\(count) seconds")
                count -= 1
            } else {
                Timer.invalidate()
            }
        }
//        print(count)
    }
    
    func typeOfEgg() {
        
    }
    
}
