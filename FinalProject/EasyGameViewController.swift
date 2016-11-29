//
//  EasyGameViewController.swift
//  FinalProject
//
//  Created by Do, Bao (dobh) on 11/8/16.
//  Copyright © 2016 Do, Bao (dobh). All rights reserved.
//

import UIKit

class EasyGameViewController: UIViewController {

    @IBOutlet var lblForCount: UILabel!
    var seconds = 60
    var timer = NSTimer()
    
    @IBOutlet weak var Image1: UIImageView!
    var location = CGPoint(x:0, y:0)
    
    @IBOutlet weak var object1: UIImageView!
    
    @IBOutlet var startOutlet: UIButton!
    
    @IBAction func funcstart(sender: AnyObject) {
       //timer =  NSTimer(timeInterval: 1, target: self, selector: Selector(counter:), userInfo: nil, repeats: true)
      //  timer = 
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "counter:" , userInfo: nil, repeats: true)
    }
    func counter(timer:NSTimer)
    {
        seconds -= 1
        lblForCount.text = String(seconds)
        if (seconds == 0)
        {
            timer.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        }
        // Do any additional setup after loading the view.

        // load the images
        
        Image1.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("ImmageTapped:"))
        
        self.Image1.addGestureRecognizer(tapGesture)
    }

    func ImmageTapped(tapGesture: UITapGestureRecognizer) {
        
        Image1.backgroundColor = UIColor.blueColor()
        Image1.center = CGPointMake(randomPosition().y, randomPosition().y)
    }
    
    func randomPosition() -> CGPoint {
        let height = self.view!.frame.height
        let width = self.view!.frame.width
        
        let randomPosition = CGPointMake(CGFloat(arc4random()) % height, CGFloat(arc4random()) % width)
        
        return checkBoundaries(randomPosition)

    }
    
    func checkBoundaries(var position: CGPoint) -> CGPoint{
        let height = self.view!.frame.height
        let width = self.view!.frame.width
        let topBound = self.navigationController?.navigationBar.frame.size.height
        // check left bound
        if(position.x - Image1.frame.width/2 < 0){
            position.x = Image1.frame.width/2
        }
        
        // check right bound
        if(position.x + Image1.frame.width/2 > width){
            position.x = width - Image1.frame.width/2
        }
        
        // check top bound
        if(position.y - Image1.frame.height/2  < topBound){
            position.y = topBound! + Image1.frame.height/2
        }
        
        // check bottom bound
        if(position.y + Image1.frame.height/2  > height){
            position.y = height - Image1.frame.height/2
        }
        
        return position
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
