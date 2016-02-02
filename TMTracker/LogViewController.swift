//
//  LogViewController.swift
//  TMTracker
//
//  Created by Byron Duenas on 2016-01-28.
//  Copyright © 2016 Em C. All rights reserved.
//

import UIKit

class LogViewController: UITableViewController {
    
    var roles : Set<String> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.editing = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let alertView = SCLAlertView()
        alertView.shouldDismissOnTapOutside = true
        alertView.soundURL = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("electriclove", ofType: "mp3")!)
        alertView.showSuccess(self, title: "Welcome", subTitle: "Have fun using TMTracker!", closeButtonTitle: nil, duration: -1.0)
    }


    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAtIndexPath: indexPath)
        cell.selectionStyle = .Blue

        return cell
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        roles.remove(cell!.textLabel!.text!)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        roles.insert(cell!.textLabel!.text!)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print(roles)
    }
    
}
