//
//  ViewController.swift
//  Bao_TodayQuote
//
//  Created by Do, Bao (dobh) on 8/25/16.
//  Copyright © 2016 Do, Bao (dobh). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // (!) is to suppress error since the variables aren't initialized
    @IBOutlet weak var lblQuote: UILabel!
    var quotes: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //1. get a reference to the app folder
        let appBundle = NSBundle.mainBundle()
        //2. get a reference to the file path for the quotesList
        let filePath = appBundle.pathForResource("quotesList", ofType: "plist")
        //3. load the quotes from the file into the array
        quotes = NSArray(contentsOfFile: filePath!)
        //4. assign a single quote to the text property of the label
        setDisplayedQuote()
    }
    
    func setDisplayedQuote(){
        lblQuote.text = quotes.objectAtIndex(Int(arc4random_uniform(UInt32(quotes.count)))) as! String
    }
    
    func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    func randomColor() -> UIColor {
        let r = randomCGFloat()
        let g = randomCGFloat()
        let b = randomCGFloat()
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    @IBAction func nextQuote() {
        setDisplayedQuote()
        view.backgroundColor = randomColor()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

