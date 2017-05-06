//
//  StatsViewController.swift
//  Do_MusicLearning
//
//  Created by Do, Bao on 9/28/16.
//  Copyright © 2016 Do, Bao. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var lblNumberOfGames: UILabel!
    @IBOutlet weak var lblRecentScore: UILabel!
    @IBOutlet weak var lblLowestScore: UILabel!
    @IBOutlet weak var lblHighestScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // retrieve the stats from the stadard user defaults
        let shareObject = NSUserDefaults.standardUserDefaults()
        let highestScore = shareObject.integerForKey("HighestScore")
        let lowestScore = shareObject.integerForKey("LowestScore")
        let recentScore = shareObject.integerForKey("RecentScore")
        let numberOfGames = shareObject.integerForKey("NumberOfGames")
        // assign the values to the labels
        lblHighestScore.text = "Highest Score: \(highestScore)"
        lblLowestScore.text = "Lowest Score: \(lowestScore)"
        lblRecentScore.text = "Recent Score: \(recentScore)"
        lblNumberOfGames.text = "Number of Games: \(numberOfGames)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
