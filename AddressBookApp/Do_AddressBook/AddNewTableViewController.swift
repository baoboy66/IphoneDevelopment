//
//  AddNewTableViewController.swift
//  Do_AddressBook
//
//  Created by Do, Bao on 10/31/16.
//  Copyright © 2016 Do, Bao. All rights reserved.
//

import UIKit

class AddNewTableViewController: UITableViewController {

    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmailAddress: UITextField!
    
    var newContact = Contact()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // if it is save segue, initilize the contact with the information that the user set
        if(segue.identifier == "SaveSegue"){
            newContact = Contact(firstName: txtFirstName.text!, lastName: txtLastName.text!, emailAddress: txtEmailAddress.text!)
        }
    }

}
