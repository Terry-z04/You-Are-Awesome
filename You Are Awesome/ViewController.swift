//
//  ViewController.swift
//  You Are Awesome
//
//  Created by Terry Zhuang on 1/6/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageNumber = 0
    var messageNumber = 0
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = ""
    }
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "You Are Fantastic!",
                        "Fabulous! That's You!"]
        
        messageLabel.text = messages[messageNumber]
        messageNumber += 1
      
        if messageNumber == messages.count {
            messageNumber = 0
        }
            
        // let imageName =  "image" + String(imageNumber)
        let imageName =  "image\(imageNumber)"
        imageView.image = UIImage(named: imageName)
        if imageNumber == 10 {
            imageNumber = 0
        } else {
            imageNumber = imageNumber + 1
        }
        
            //        let awesomeMessage = "You Are Awesome!"
            //        let greatMessage = "You Are Great!"
            //        let bombMessage = "You Are Da Bomb!"
            //        if messageLabel.text == awesomeMessage {
            //            messageLabel.text = greatMessage
            //            imageView.image = UIImage(named: "image1")
            //        } else if messageLabel.text == greatMessage {
            //            messageLabel.text = bombMessage
            //            imageView.image = UIImage(named: "image2")
            //        } else {
            //            messageLabel.text = awesomeMessage
            //            imageView.image = UIImage(named: "image0")
            //        }
    }
    
}

