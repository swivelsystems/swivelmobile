//
//  DatesViewController.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-05-04.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import UIKit
import CoreData

class DatesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //views on the Screen
    @IBOutlet weak var tableView: UITableView!
    
    var dates: JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        tableView.dataSource = self
        refreshControl.addTarget(self, action: "refreshDates:", forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)
    }
    
    
    func refreshDates(refreshControl: UIRefreshControl) {
        print("refresh Dates")
        refreshControl.endRefreshing()
    }
    
    //Table Rendering functions
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DatesCell
        cell.title?.text = "assignment"
        cell.priority?.text = "urgent"
        cell.dueDate?.text = "tomorrow"
        return cell
    }
    
}
