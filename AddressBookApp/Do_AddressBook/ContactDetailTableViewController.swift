//
//  ContactDetailTableViewController.swift
//  Do_AddressBook
//
//  Created by Do, Bao on 10/31/16.
//  Copyright © 2016 Do, Bao. All rights reserved.
//

import UIKit

class ContactDetailTableViewController: UITableViewController {

    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    var contact : Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblFirstName.text = contact.firstName
        lblLastName.text = contact.lastName
        lblEmail.text = contact.emailAddress
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
