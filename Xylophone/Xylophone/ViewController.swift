//
//  ViewController.swift
//  Xylophone
//
//  Created by kirtiparghi on 2021-04-05.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        sender.layer.opacity = 0.5
        playSound(soundName: sender.currentTitle!)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.layer.opacity = 1
        }
    }
    
    func playSound(soundName: String) {
        let path = Bundle.main.path(forResource: soundName, ofType: "wav")
        let url = URL(fileURLWithPath: path!)

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url)
            player!.volume = 1.0
            player!.prepareToPlay()
            player!.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    

}

