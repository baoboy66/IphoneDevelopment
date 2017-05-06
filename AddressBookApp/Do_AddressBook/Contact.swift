//
//  Contact.swift
//  Do_AddressBook
//
//  Created by Do, Bao on 10/31/16.
//  Copyright © 2016 Do, Bao. All rights reserved.
//

import UIKit

class Contact: NSObject, NSCoding {
    // add adtributes (instance variables)
    var firstName: String
    var lastName: String
    var emailAddress: String
    // add class initializers
    override init(){
        firstName = "Bao"
        lastName = "Do"
        emailAddress = "dobh@mail.uc.edu"
    }
    init(firstName fn:String, lastName ln:String, emailAddress ea:String){
        firstName = fn
        lastName = ln
        emailAddress = ea
    }
    // add tasks or function
    required init?(coder aDecoder: NSCoder) {
        firstName = aDecoder.decodeObjectForKey("FirstName") as! String
        lastName = aDecoder.decodeObjectForKey("LastName") as! String
        emailAddress = aDecoder.decodeObjectForKey("EmailAddress") as! String
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(firstName, forKey: "FirstName")
        aCoder.encodeObject(lastName, forKey: "LastName")
        aCoder.encodeObject(emailAddress, forKey: "EmailAddress")
    }
}
