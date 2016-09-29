//
//  ViewController.swift
//  SimpleSpeakApp
//
//  Created by Yury Gitman on 9/29/16.
//  Copyright © 2016 com.yuryg. All rights reserved.
//

import UIKit
import AVFoundation


//  ViewController Class-Wide Variables
let mySpeechSynth = AVSpeechSynthesizer()
var floatRate: Float = 0.5
var stringRate = "0.5"



class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var rateSpeedLabel: UILabel!
    
    
    @IBAction func speakPressed(_ sender: UIButton) {
        
        let usersWord = myTextField.text
        
        speakThisPhrase(passedString: usersWord!)
        
    }
    @IBAction func sliderMoved(_ sender: UISlider) {
            floatRate = sender.value
            stringRate = String(floatRate)
            rateSpeedLabel.text = stringRate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTextField.text = "type a word here and press 'Speak'"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    // from:
    // Pass a String, This Function Speaks it.
    // Change "rate" and "voice" to hear different voices. 
    func speakThisPhrase(passedString: String){
        
        let myUtterance = AVSpeechUtterance(string: passedString)
        myUtterance.rate = floatRate
        myUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        mySpeechSynth.speak(myUtterance)
        
        
    }
    
}

