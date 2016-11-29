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
    var timer = 60
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 var clock = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countdown", userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
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
