//
//  HelpViewController.swift
//  Do_MusicLearning
//
//  Created by Do, Bao on 9/28/16.
//  Copyright © 2016 Do, Bao. All rights reserved.
//

import UIKit
import AVFoundation

class HelpViewController: UIViewController {

    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func PlayNote(sender: UIButton) {
        //1. retrieve the name of the note from the text of the button
        let fileName = sender.titleLabel?.text!
        //2. get a reference to the mp3 file that corresponds to the note
        let appBundle = NSBundle.mainBundle()
        let fileUrl = appBundle.URLForResource(fileName, withExtension: "mp3")!
        //3. initilize the audio player object
        // try! to suppress the error
        player = try! AVAudioPlayer(contentsOfURL: fileUrl)
        //4. play sound
        player.play()
        
    }

}
