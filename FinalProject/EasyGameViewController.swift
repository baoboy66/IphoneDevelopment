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
    
    
    
    @IBOutlet var startOutlet: UIButton!
    @IBAction func funcstart(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector(counter()), userInfo: nil, repeats: true)
    }
    func counter()
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
