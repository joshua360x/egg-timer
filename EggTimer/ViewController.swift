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
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var count = 60

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
        

        
        print(eggTimes[hardness])
    }
    
    func update() {

        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.count > 0 {
                print ("\(self.count) seconds")
                self.count -= 1
            } else {
                Timer.invalidate()
            }
        }
        print(count)
    }
    
    func typeOfEgg() {
        
    }
    
}
