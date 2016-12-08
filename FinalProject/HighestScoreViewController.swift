//
//  HighestScoreViewController.swift
//  FinalProject
//
//  Created by Do, Bao (dobh) on 11/8/16.
//  Copyright © 2016 Do, Bao (dobh). All rights reserved.
//

import UIKit

class HighestScoreViewController: UIViewController {

    @IBOutlet weak var lblhigh: UILabel!
    @IBOutlet weak var lbllow: UILabel!
    @IBOutlet weak var lblgame: UILabel!
    @IBOutlet weak var lblrecent: UILabel!
    
    @IBOutlet weak var Mlblhigh: UILabel!
    @IBOutlet weak var Mlbllow: UILabel!
    @IBOutlet weak var Mlblgame: UILabel!
    @IBOutlet weak var Mlblrecent: UILabel!
    
    @IBOutlet weak var Hlblhigh: UILabel!
    @IBOutlet weak var Hlbllow: UILabel!
    @IBOutlet weak var Hlblgame: UILabel!
    @IBOutlet weak var Hlblrecent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // retrieve the stats from the stadard user defaults
        let shareObject = NSUserDefaults.standardUserDefaults()
        let highestScore = shareObject.integerForKey("HighestScore")
        let lowestScore = shareObject.integerForKey("LowestScore")
        let recentScore = shareObject.integerForKey("RecentScore")
        let numberOfGames = shareObject.integerForKey("NumberOfGames")
        
        let mhighestScore = shareObject.integerForKey("mHighestScore")
        let mlowestScore = shareObject.integerForKey("mLowestScore")
        let mrecentScore = shareObject.integerForKey("mRecentScore")
        let mnumberOfGames = shareObject.integerForKey("mNumberOfGames")
        
        let hhighestScore = shareObject.integerForKey("hHighestScore")
        let hlowestScore = shareObject.integerForKey("hLowestScore")
        let hrecentScore = shareObject.integerForKey("hRecentScore")
        let hnumberOfGames = shareObject.integerForKey("hNumberOfGames")
        
        // assign the values to the labels
        lblhigh.text = "Highest Score: \(highestScore)"
        lbllow.text = "Lowest Score: \(lowestScore)"
        lblrecent.text = "Recent Score: \(recentScore)"
        lblgame.text = "Number of Games: \(numberOfGames)"
        
        Mlblhigh.text = "Highest Score: \(mhighestScore)"
        Mlbllow.text = "Lowest Score: \(mlowestScore)"
        Mlblrecent.text = "Recent Score: \(mrecentScore)"
        Mlblgame.text = "Number of Games: \(mnumberOfGames)"
        
        Hlblhigh.text = "Highest Score: \(hhighestScore)"
        Hlbllow.text = "Lowest Score: \(hlowestScore)"
        Hlblrecent.text = "Recent Score: \(hrecentScore)"
        Hlblgame.text = "Number of Games: \(hnumberOfGames)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
