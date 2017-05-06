//
//  AddressBookTableViewController.swift
//  Do_AddressBook
//
//  Created by Do, Bao on 10/31/16.
//  Copyright © 2016 Do, Bao. All rights reserved.
//

import UIKit

class AddressBookTableViewController: UITableViewController {
    
    var dataSource = ContactsDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.countOfContacts()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactCell", forIndexPath: indexPath)

         //Configure the cell...
        let currentIndex = indexPath.row
        let tempContact = dataSource.contactAtIndex(contactIndex: currentIndex)
        cell.textLabel?.text = tempContact.lastName
        cell.detailTextLabel?.text = tempContact.firstName
        return cell
    }
    
    // cancell action
    @IBAction func Cancel(segue: UIStoryboardSegue){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func Save(segue: UIStoryboardSegue){
        // retrieve the new contact
        let source = segue.sourceViewController as! AddNewTableViewController
        // add the new contact to the data source
        dataSource.addContact(contact: source.newContact)
        // refresh the table view
        tableView.reloadData()
        // dismiss the table view
        dismissViewControllerAnimated(true, completion: nil)
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            dataSource.deleteContactAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }  
    }

    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        dataSource.moveContacts(fromContactIndex: fromIndexPath.row, toContactIndex: toIndexPath.row)

    }

    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ContactDetailSegue"){
            let selectedIndex = tableView.indexPathForSelectedRow?.row
            let selectedContact = dataSource.contactAtIndex(contactIndex: selectedIndex!)
            let destination = segue.destinationViewController as! ContactDetailTableViewController
            destination.contact = selectedContact
        }
    }

}
