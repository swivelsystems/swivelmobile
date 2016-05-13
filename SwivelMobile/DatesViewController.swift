//
//  DatesViewController.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-05-04.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import UIKit

class DatesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //Styling

    //Temporary Data

    var assignments: [[String]]? = []

    //Elements on the Screen
    @IBOutlet weak var chatButton: UIBarButtonItem!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!

    //Load on first render (will only load once)
    override func viewDidLoad() {
        super.viewDidLoad()

        assignments = Package.sharedInstance.assignments
        //Styling

        if revealViewController() != nil {

            revealViewController().rightViewRevealWidth = 300
            chatButton.target = revealViewController()
            chatButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))

            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))

            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

        let refreshControl = UIRefreshControl()
        tableView.dataSource = self
        refreshControl.addTarget(self, action: #selector(DatesViewController.refreshDates(_:)), forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)
    }

    //Load on each switch into view
    override func viewWillAppear(animated: Bool) {
    }


    //Local Variables
    var dates: JSON?

    //Functions
    func refreshDates(refreshControl: UIRefreshControl) {
        Package.sharedInstance.update()
        //Table Refresh
        print("refresh Dates")
        refreshControl.endRefreshing()
    }


    //Table Specifications
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments!.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DatesCell
        let dateString = String(self.assignments![indexPath.row][1])
        let index10 = dateString.startIndex.advancedBy(10)
            
        cell.title?.text = String(self.assignments![indexPath.row][0])
        cell.course?.text = String(self.assignments![indexPath.row][3])
        cell.weight?.text = "Weight: " + String(self.assignments![indexPath.row][2]) + "%"
        cell.dueDate?.text = "Due: " + dateString.substringToIndex(index10)
        cell.card?.layer.borderWidth = 1
        cell.card?.layer.borderColor = UIColor(red:218.0/255.0, green:226.0/255.0, blue:228.0/255.0, alpha: 1.0).CGColor
        return cell
    }

}
