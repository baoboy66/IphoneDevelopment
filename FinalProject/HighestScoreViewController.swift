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
    override func viewDidLoad() {
        super.viewDidLoad()

        // retrieve the stats from the stadard user defaults
        let shareObject = NSUserDefaults.standardUserDefaults()
        let highestScore = shareObject.integerForKey("HighestScore")
        let lowestScore = shareObject.integerForKey("LowestScore")
        let recentScore = shareObject.integerForKey("RecentScore")
        let numberOfGames = shareObject.integerForKey("NumberOfGames")
        
        // assign the values to the labels
        lblhigh.text = "Highest Score: \(highestScore)"
        lbllow.text = "Lowest Score: \(lowestScore)"
        lblrecent.text = "Recent Score: \(recentScore)"
        lblgame.text = "Number of Games: \(numberOfGames)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
