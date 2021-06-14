//
//  ViewController.swift
//  toggle他愛我他不愛我
//
//  Created by ROSE on 2021/6/13.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var isLove = true
    @IBOutlet weak var petalsButton: UIButton!
    @IBOutlet weak var loveLabel: UILabel!
    @IBOutlet weak var girlImageView: UIImageView!
    
    @IBOutlet weak var speakMultiplier: UISlider!
    @IBOutlet weak var speakRate: UISlider!
    @IBOutlet weak var speakMultiplierLabel: UILabel!
    @IBOutlet weak var speakRateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 自訂Slider圖案
        speakMultiplier.setThumbImage(UIImage(named: "flowers-icon"), for: .normal)
        speakRate.setThumbImage(UIImage(named: "flowers-icon"), for: .normal)
    }
    
    @IBAction func press(_ sender: UIButton) {
        // toggle() = 切換true或false
        isLove.toggle()
        print(isLove)
        
        
        if isLove == true {
            loveLabel.text = "他愛我"
            girlImageView.image = UIImage(named: "yes")
            speak()
        } else{
            loveLabel.text = "他不愛我"
            girlImageView.image = UIImage(named: "not")
            speak()
        }
    }
    
    // 音調速度
    @IBAction func changeSlider(_ sender: UISlider) {
        speakRateLabel.text = String(format: "%.2f", speakRate.value)
        speakMultiplierLabel.text = String(format: "%.2f", speakMultiplier.value)
    }
    
    func speak() {
        let utterance = AVSpeechUtterance(string: loveLabel.text!)
                let synthesizer = AVSpeechSynthesizer()
                utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        utterance.rate = speakRate.value
        utterance.pitchMultiplier = speakMultiplier.value
                synthesizer.speak(utterance)
    }
    


}

