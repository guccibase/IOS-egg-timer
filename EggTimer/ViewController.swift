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
    var bombSoundEffect: AVAudioPlayer?

    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    let times = ["soft": 7, "medium": 10, "hard": 15]
    var totalTime = 0
    var timer = Timer()
    var secondsPassed = 0
  let path = Bundle.main.path(forResource: "alarm_sound.mp3", ofType:nil)!
    

    @IBAction func hardnestSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
      let  hardness = sender.currentTitle
        switch hardness {
        case "Soft":
            titleLable.text = "Soft"

            totalTime = times["soft"]!
            timer =  Timer.scheduledTimer(
                timeInterval: 1.0,
                                     
                target: self,
                selector: #selector(update),
                                       
                userInfo: true,
                repeats: true
            )
           
            break
            case "Medium":
                titleLable.text = "Medium"

             totalTime = times["medium"]!
              timer =         Timer.scheduledTimer(
                           timeInterval: 1.0,
                                                
                           target: self,
                           selector: #selector(update),
                                                  
                           userInfo: true,
                           repeats: true
                       )
            break
            case "Hard":
                titleLable.text = "Hard"

             totalTime = times["hard"]!
               timer =        Timer.scheduledTimer(
                           timeInterval: 1.0,
                                                
                           target: self,
                           selector: #selector(update),
                                                  
                           userInfo: true,
                           repeats: true
                       )
            break
        default:
            print("No hardness")
        }
        
        
      
    }
    
    
    @objc func update(){
        if totalTime >= secondsPassed {
            progressBar.progress=Float(secondsPassed)/Float(totalTime)

            print(Float(secondsPassed)/Float(totalTime))
            secondsPassed += 1
        } else{
            timer.invalidate()
            titleLable.text = "DONE"
          
            let url = URL(fileURLWithPath: path)

           do {
               bombSoundEffect = try AVAudioPlayer(contentsOf: url)
               bombSoundEffect?.play()
           } catch {
               // couldn't load file :(
           }
        }
    }
}
