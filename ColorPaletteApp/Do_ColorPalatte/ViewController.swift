//
//  ViewController.swift
//  Do_ColorPalatte
//
//  Created by Do, Bao (dobh) on 9/1/16.
//  Copyright © 2016 Do, Bao (dobh). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var lblRed: UILabel!
    @IBOutlet weak var lblGreen: UILabel!
    @IBOutlet weak var lblBlue: UILabel!
    @IBOutlet weak var lblAlpha: UILabel!
    @IBOutlet weak var sldBlue: UISlider!
    @IBOutlet weak var sldGreen: UISlider!
    @IBOutlet weak var sldRed: UISlider!
    @IBOutlet weak var sldAlpha: UISlider!
    var drawingCanvas : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        changeColor()
        drawingCanvas = UIImageView(frame: view.frame)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeColor() {
        //1. Read the current value of the slider
        let redValue = sldRed.value
        let greenValue = sldGreen.value
        let blueValue = sldBlue.value
        let alphaValue = sldAlpha.value
        //2. Create a color using the slider value
        let userColor = UIColor(red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: CGFloat(alphaValue))
        //3. set the background of the colorValue to the new color
        colorView.backgroundColor = userColor
        //4. set the label text to the color component value
        let redAsString = String.localizedStringWithFormat("%.0f", redValue * 255)
        let blueAsString = String.localizedStringWithFormat("%.0f", blueValue * 255)
        let greenAsString = String.localizedStringWithFormat("%.0f", greenValue * 255)
        let alphaAsString = String.localizedStringWithFormat("%.0f%%", alphaValue * 100)
        lblRed.text = redAsString
        lblBlue.text = blueAsString
        lblGreen.text = greenAsString
        lblAlpha.text = alphaAsString
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //1. use the seque to retrieve a reference to the second screen
        let destination = segue.destinationViewController as! SecondController
        //2. assign the background color to the destination property
        destination.paintingColor = colorView.backgroundColor
        destination.canvas = drawingCanvas
        
    }
}

