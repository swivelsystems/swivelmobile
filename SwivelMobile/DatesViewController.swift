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

    //Elements on the Screen
    @IBOutlet weak var chatButton: UIBarButtonItem!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!

    //Load on first render (will only load once)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Styling
        
        if revealViewController() != nil {
            
            revealViewController().rightViewRevealWidth = 300
            chatButton.target = revealViewController()
            chatButton.action = "rightRevealToggle:"
            
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
