//
//  ViewController.swift
//  Do_UnitConverter
//
//  Created by Do, Bao on 9/19/16.
//  Copyright © 2016 Do, Bao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var units: NSDictionary!
    var keys: NSArray!
    
    @IBOutlet weak var pvUnitTo: UIPickerView!
    @IBOutlet weak var pvUnitFrom: UIPickerView!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var txtAmount: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let appBundle = NSBundle.mainBundle()
        let filePath = appBundle.pathForResource("unitsList", ofType: "plist")
        units = NSDictionary(contentsOfFile: filePath!)
        keys = units.allKeys as NSArray
        keys = keys.sort(sortKeys)
    }

    func sortKeys(first: AnyObject, second: AnyObject) -> Bool{
        let firstKey = first as! String
        let secondKey = second as! String
        return firstKey.caseInsensitiveCompare(secondKey) == NSComparisonResult.OrderedAscending
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return units.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let title = keys.objectAtIndex(row) as! String
        return title
    }

    @IBAction func Convert() {
        let amountAsString = txtAmount.text!
        let numberFormatter = NSNumberFormatter()
        let amountAsNumber = numberFormatter.numberFromString(amountAsString)!
        let amountAsFloat = amountAsNumber.floatValue
        let indexOfSelectionUnitFrom = pvUnitFrom.selectedRowInComponent(0)
        let unitFrom = keys.objectAtIndex(indexOfSelectionUnitFrom) as! String
        let indexOfSelectionUnitTo = pvUnitTo.selectedRowInComponent(0)
        let unitTo = keys.objectAtIndex(indexOfSelectionUnitTo) as! String
        let conversionFactorToInch = units.valueForKey(unitFrom) as! Float
        let resultAsInch = amountAsFloat * conversionFactorToInch
        let conversionFractorFromInch = units.valueForKey(unitTo) as! Float
        let result = resultAsInch / conversionFractorFromInch
        let resultAsString = String.localizedStringWithFormat("%0.3f %@ = %.3f %@", amountAsFloat, unitFrom, result, unitTo)
        lblResult.text = resultAsString
        
    }
}

