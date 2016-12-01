//
//  EasyGameViewController.swift
//  FinalProject
//
//  Created by Do, Bao (dobh) on 11/8/16.
//  Copyright © 2016 Do, Bao (dobh). All rights reserved.
//

import UIKit

class EasyGameViewController: UIViewController {

    @IBAction func MoveBug(sender: UIButton) {
        
        // Find the button's width and height
        let buttonWidth = sender.frame.width
        let buttonHeight = sender.frame.height
        
        //find the width and height of the view
        let viewWidth = sender.superview!.bounds.width
        let viewHeight = sender.superview!.bounds.height
        
        // Width and height of the area contain lady bug
        let xwidth = viewWidth - buttonWidth
        let yheight = viewHeight - buttonHeight - (self.navigationController?.navigationBar.frame.height)!
        
        // generate random x and y offset
        let xoffset = CGFloat(arc4random_uniform(UInt32(floor (xwidth))))
        let yoffset = CGFloat(arc4random_uniform(UInt32(floor (yheight))))
        
        // offset the button's center by the random offset
        sender.center.x = xoffset + buttonWidth/2
        sender.center.y = yoffset + buttonHeight/2 + (self.navigationController?.navigationBar.frame.height)!
        
        
        score += 1
        //updateScore()
    }
    
    @IBOutlet weak var scorelbl: UILabel!
    @IBOutlet var lblForCount: UILabel!
    var seconds = 60
    var timer = NSTimer()
    
    var score = 0
    
    @IBOutlet weak var Image1: UIImageView!
    
    @IBOutlet var startOutlet: UIButton!
    
    @IBAction func funcstart(sender: AnyObject) {
       //timer =  NSTimer(timeInterval: 1, target: self, selector: Selector(counter:), userInfo: nil, repeats: true)
      //  timer = 

        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(EasyGameViewController.counter(_:)) , userInfo: nil, repeats: true)
    }
    func counter(timer:NSTimer)
    {
        seconds -= 1
        //scorelbl.text = String(score)
        if (seconds == 0)
        {
            timer.invalidate()
            updateStat()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load the images
        
        Image1.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EasyGameViewController.ImageTapped(_:)))
        
        self.Image1.addGestureRecognizer(tapGesture)
    }

    func ImageTapped(tapGesture: UITapGestureRecognizer) {

        Image1.backgroundColor = UIColor.blueColor()
        randomPosition()
        
        score += 1
        //updateScore()
    }
    
    func randomPosition() {
        
        // Find the button's width and height
        let buttonWidth = Image1.frame.width
        let buttonHeight = Image1.frame.height
        
        //find the width and height of the view
        let viewWidth = Image1.superview!.bounds.width
        let viewHeight = Image1.superview!.bounds.height
        
        // Width and height of the area contain lady bug
        let xwidth = viewWidth - buttonWidth
        let yheight = viewHeight - buttonHeight - (self.navigationController?.navigationBar.frame.height)!
        
        // generate random x and y offset
        let xoffset = CGFloat(arc4random_uniform(UInt32(floor (xwidth))))
        let yoffset = CGFloat(arc4random_uniform(UInt32(floor (yheight))))
        
        // offset the button's center by the random offset
        Image1.center.x = xoffset + buttonWidth/2
        Image1.center.y = yoffset + buttonHeight/2 + (self.navigationController?.navigationBar.frame.height)!
    }
    
    func updateScore(){
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
