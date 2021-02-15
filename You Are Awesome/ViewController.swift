//
//  ViewController.swift
//  You Are Awesome
//
//  Created by Terry Zhuang on 1/6/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playSoundSwitch: UISwitch!
    
    
    var imageNumber = -1
    var messageNumber = -1
    var soundNumber = -1
    
    var audioPlayer: AVAudioPlayer!
    let totalNumberOfSounds = 6
    let totalNumberOfImages = 9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = ""
    }
    
    func playSound (name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("😡 ERROR: \(error.localizedDescription) Could not initialize AVAudioPlayer object.")
            }
        } else {
            print("😡 ERROR: Could not read data from file Sound")
        }
    }
    
    func nonRepeatingRandom(originalNumber: Int, upperLimit: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperLimit)
        } while originalNumber == newNumber
        return newNumber
    }
    
    
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "You Are Fantastic!",
                        "When the Genius Bar Needs Help, They Call You!",
                        "Fabulous! That's You!",
                        "You've Got The Design Skills of Jony Ive"]
      
        messageNumber = nonRepeatingRandom(originalNumber: messageNumber, upperLimit: messages.count - 1)
        messageLabel.text = messages[messageNumber]
        
        imageNumber = nonRepeatingRandom(originalNumber: imageNumber, upperLimit: totalNumberOfImages - 1)
        imageView.image = UIImage(named: "image\(imageNumber)")
        
        soundNumber = nonRepeatingRandom(originalNumber: soundNumber, upperLimit: totalNumberOfSounds - 1)
        if playSoundSwitch.isOn {
            playSound(name: "Sound\(soundNumber)")
        }
        
     // show a msg
//        var newMessageNumber: Int
//        repeat {
//            newMessageNumber = Int.random(in: 0...messages.count - 1)
//        } while messageNumber == newMessageNumber
//        messageNumber = newMessageNumber
//        messageLabel.text = messages[messageNumber]
        
    // show an Image
//        var newImageNumber: Int
//       repeat {
//        newImageNumber = Int.random(in: 0...totalNumberOfImages)
//       } while imageNumber == newImageNumber
//        imageNumber = newImageNumber
//        imageView.image = UIImage(named: "image\(imageNumber)")
        
    // Get a random numnber to use in our Sound Name file
//        var newSoundNumber: Int
//       repeat {
//        newSoundNumber = Int.random(in: 0...totalNumberOfSounds - 1)
//       } while soundNumber == newSoundNumber
//        soundNumber = newSoundNumber
//        print("*** The New Sound Number is \(soundNumber)")
//
//        playSound(name: "Sound\(soundNumber)")
    }
    
    @IBAction func playSoundToggled(_ sender: UISwitch) {
        if !sender.isOn && audioPlayer != nil { // if the .isOn is NOT TRUE
            audioPlayer.stop()
        }
    
    }
    

}
