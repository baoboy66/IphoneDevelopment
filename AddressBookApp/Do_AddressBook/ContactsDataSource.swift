//
//  ContactsDataSource.swift
//  Do_AddressBook
//
//  Created by Do, Bao on 10/31/16.
//  Copyright © 2016 Do, Bao. All rights reserved.
//

import UIKit

class ContactsDataSource: NSObject {
    // list attributes (instance variables)
    let contacts = NSMutableArray()
    // define initializers
    override init(){
        // create sample contact
        //let sampleContact = Contact()
        // add the contact to the array
        //contacts.addObject(sampleContact)
        //load contacts
        super.init()
        self.getContacts()
    }
    // define tasks (or functions)
    func countOfContacts() -> Int {
        return contacts.count
    }
    func contactAtIndex(contactIndex index:Int) -> Contact{
        return contacts.objectAtIndex(index) as! Contact
    }
    func addContact(contact c:Contact){
        contacts.addObject(c)
        saveContacts()
    }
    func deleteContactAtIndex(index: Int){
        contacts.removeObjectAtIndex(index)
        saveContacts()
    }
    func moveContacts(fromContactIndex fromIndex:Int, toContactIndex toIndex: Int){
        // retrieve the contact that will be moved from
        let fromContact = contacts.objectAtIndex(fromIndex) as! Contact
        let toContact = contacts.objectAtIndex(toIndex) as! Contact
        // replace the contacts in the array
        contacts.replaceObjectAtIndex(fromIndex, withObject: toContact)
        contacts.replaceObjectAtIndex(toIndex, withObject: fromContact)
        saveContacts()
    }
    func getFileURLPath() -> NSURL{
        // get a reference to the file manager
        let fileManager = NSFileManager.defaultManager()
        // get a reference to the ApplicationSupport directory
        let appSupportDirectory = try! fileManager.URLForDirectory(NSSearchPathDirectory.ApplicationDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL:nil, create: true)
        // add our file to the directory
        let fileURl = appSupportDirectory.URLByAppendingPathComponent("addressBook.data")
        //return the file URL
        return fileURl
    }
    func saveContacts(){
        // retrieve location of the file
        let filePath = getFileURLPath().path!
        // save the contacts array to the file
        NSKeyedArchiver.archiveRootObject(contacts, toFile: filePath)
    }
    func getContacts(){
        // retrieve the location of the file
        let filePath = getFileURLPath().path!
        // open the file and load content into the array(only if the file exists)
        let fileManager = NSFileManager.defaultManager()
        if(fileManager.fileExistsAtPath(filePath)){
            let contentsOfFile = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as! NSArray
            contacts.addObject(contentsOfFile as [AnyObject])
        }
    }
}
