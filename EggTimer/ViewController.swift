//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
//        print("This is the type of egg : \(sender.currentTitle)")
        let hardness = sender.currentTitle
        if hardness == "Soft" {
            print("Cook time should be: \(softTime)")
        }
        if hardness == "Medium" {
              print("Cook time should be: \(mediumTime)")
          }
        if hardness == "Hard" {
              print("Cook time should be: \(hardTime)")
          }
        
    }
    
    func typeOfEgg() {
        
    }
    
}
