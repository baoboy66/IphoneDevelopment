//
//  ViewController.swift
//  Do_MusicLearning
//
//  Created by Do, Bao on 9/28/16.
//  Copyright © 2016 Do, Bao. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var turnCounter : Int = 0
    let MAXTURN : Int = 3
    var noteURLS : NSArray!
    var player : AVAudioPlayer!
    var currentNote : String!
    var correctAnswerCounter : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var btnStart: UIButton!
    
    @IBOutlet weak var incorrectAnswer: UIImageView!
    @IBOutlet weak var correctAnswer: UIImageView!
    @IBOutlet weak var lblTurn: UILabel!
    @IBOutlet weak var lblAnswer: UILabel!

    
    @IBOutlet var noteButtonsCollection: [UIButton]!
    func setNoteButtonsStatus(status: Bool){
        for noteButton in noteButtonsCollection{
            noteButton.enabled = status
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appBundle = NSBundle.mainBundle()
        noteURLS = appBundle.URLsForResourcesWithExtension("mp3", subdirectory: nil)!
        // disable the note button
        setNoteButtonsStatus(false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGame() {
        // disable start button
        btnStart.enabled = false
        // reset the game
        resetGame()
        // play the game
        playGame()
    }
    
    func playGame(){
        // rest the turn
        resetTurn()
        // check if there are still turns
        if(turnCounter < MAXTURN)
        {
            // play a random sound
            playRandomNote()
            //enable note button
            setNoteButtonsStatus(true)
        }
        else{
            // end game
            endGame()
            setNoteButtonsStatus(false)
        }
        // then play a random sound or end the game
    }
    
    func playRandomNote(){
        // get the random number between 0 and the count of the notesURLS array
        let randomIndex = random() % noteURLS.count
        // get the url for a note file at the randomIndex
        let randomURL = noteURLS.objectAtIndex(randomIndex) as! NSURL
        // initilize the audio player
        try! player = AVAudioPlayer(contentsOfURL: randomURL)
        // Play the sound
        player.play()
        //log current note
        currentNote = randomURL.lastPathComponent
        NSLog("Current note is %@", currentNote)
    }
    func resetTurn(){
        incorrectAnswer.alpha = 0
        correctAnswer.alpha = 0
        lblAnswer.text = ""
        lblTurn.text = ""
    }
    
    func resetGame(){
        turnCounter = 0
        correctAnswerCounter = 0
    }
    
    func endGame(){
        //calculate the score
        score = correctAnswerCounter * 100 / MAXTURN
        // display the end game screen
        let alert = UIAlertController(title: "Game End", message: "Game Over \n Your Score is \(score)%", preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
        //update stats
        updateStats()
        //enable start button
        btnStart.enabled = true
    }
    
    func updateStats(){
        // retrieve the stats from the user defaults
        let shareObject = NSUserDefaults.standardUserDefaults()
        var highestScore = shareObject.integerForKey("HighestScore")
        var lowestScore = shareObject.integerForKey("LowestScore")
        var numberOfGames = shareObject.integerForKey("NumberOfGames")
        //update the stats based on the currect game results
        let recentScore = score
        numberOfGames += 1
        if(highestScore < score){
            highestScore = score
        }
        if(lowestScore > score || numberOfGames == 1){
            lowestScore = score
        }
        // save the stats back to the user defaults
        shareObject.setInteger(recentScore, forKey: "RecentScore")
        shareObject.setInteger(highestScore, forKey: "HighestScore")
        shareObject.setInteger(lowestScore, forKey: "LowestScore")
        shareObject.setInteger(numberOfGames, forKey: "NumberOfGames")

    }
    @IBAction func checkAnswer(buttonClicked: UIButton){
        // diable note button
        setNoteButtonsStatus(true)
        // retrieve the name of the note that the user seleted
        let label = buttonClicked.titleLabel!
        let text = label.text!
        let userNote = text + ".mp3"
        //set an animation block
        UIView.beginAnimations("answer", context: nil)
        UIView.setAnimationDuration(2)
        // check the answer
        if(userNote == currentNote)
        {
            //correct answer 
            lblAnswer.textColor = UIColor.greenColor()
            lblAnswer.text = "Correct Answer!"
            correctAnswer.alpha = 1.0
            correctAnswerCounter += 1
        }
        else{
            lblAnswer.textColor = UIColor.redColor()
            lblAnswer.text = "Incorrect Answer!"
            incorrectAnswer.alpha = 1.0
        }
        setNoteButtonsStatus(false)
        // update the turn counter
        turnCounter += 1
        //end the animation block
        UIView.commitAnimations()
        lblTurn.text = "Attempt \(turnCounter) / \(MAXTURN)"
        //play another turn
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(ViewController.playGame), userInfo: nil, repeats: false)
    }
}

