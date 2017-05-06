//
//  SecondController.swift
//  Do_ColorPalatte
//
//  Created by Do, Bao on 9/13/16.
//  Copyright © 2016 Do, Bao (dobh). All rights reserved.
//

import UIKit

class SecondController: UIViewController {
    
    var canvas : UIImageView!
    var path : UIBezierPath = UIBezierPath()
    var brushSize = 5
    var paintingColor : UIColor!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(canvas)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        let startingPoint = touch.locationInView(canvas)
        path.moveToPoint(startingPoint)
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        let currentPoint = touch.locationInView(canvas)
        path.addLineToPoint(currentPoint)
        UIGraphicsBeginImageContext(canvas.frame.size)
        canvas.image?.drawInRect(canvas.frame)
        path.lineWidth = CGFloat(brushSize)
        paintingColor.setStroke()
        path.stroke()
        canvas.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}