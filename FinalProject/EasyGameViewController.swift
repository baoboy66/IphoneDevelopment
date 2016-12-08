//
//  EasyGameViewController.swift
//  FinalProject
//
//  Created by Do, Bao (dobh) on 11/8/16.
//  Copyright © 2016 Do, Bao (dobh). All rights reserved.
//

import UIKit

class EasyGameViewController: UIViewController {
    
    @IBOutlet weak var scorelbl: UILabel!
    @IBOutlet var lblForCount: UILabel!
    var seconds = 60
    var timer = NSTimer()
    
    var score = 0
    
    @IBOutlet weak var Image2: UIImageView!
    @IBOutlet weak var Image1: UIImageView!
    
    @IBOutlet var startOutlet: UIButton!
    
    @IBAction func funcstart(sender: AnyObject) {
        reset()
        // add timer
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "counter:", userInfo: nil, repeats: true)
    }
    func counter(timer:NSTimer)
    {
        seconds -= 1
        lblForCount.text = String(seconds)
        scorelbl.text = String(score)
        if (seconds <= 0)
        {
            timer.invalidate()
            updateStat()
            endGame()
            reset()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load the images
        Image1.userInteractionEnabled = true
        Image2.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("ImageTapped:"))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: Selector("ImageTapped2:"))
        
        
        self.Image2.addGestureRecognizer(tapGesture2)
        self.Image1.addGestureRecognizer(tapGesture)
    }

    func ImageTapped2(tapGesture: UITapGestureRecognizer) {
        randomPosition(Image2)
        updateScore()
    }
    func ImageTapped(tapGesture: UITapGestureRecognizer) {
        randomPosition(Image1)
        updateScore()
    }
    
    func endGame(){
        // display the end game screen
        let alert = UIAlertController(title: "Game End", message: "Game Over \n Your Score is \(score)", preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
    }
    func reset() {
        score = 0;
        seconds = 60;
        lblForCount.text = String(seconds)
        scorelbl.text = String(score)
    }
    func randomPosition(image: UIImageView) {
        
        // Find the button's width and height
        let imageWidth = image.frame.width
        let imageHeight = image.frame.height
        
        //find the width and height of the view
        let viewWidth = image.superview!.bounds.width
        let viewHeight = image.superview!.bounds.height
        
        // Width and height of the area contain lady bug
        let xwidth = viewWidth - imageWidth
        let yheight = viewHeight - imageHeight - 150
        
        // generate random x and y offset
        let xoffset = CGFloat(arc4random_uniform(UInt32(floor (xwidth))))
        let yoffset = CGFloat(arc4random_uniform(UInt32(floor (yheight))))
        
        // offset the image's center by the random offset
        image.center.x = xoffset + imageWidth/2
        image.center.y = yoffset + imageHeight/2 + 150
    }
    
    func updateScore(){
        score += 1
        scorelbl.text = String(score)
    }
    
    func updateStat(){
        // get reference to the user default object
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
