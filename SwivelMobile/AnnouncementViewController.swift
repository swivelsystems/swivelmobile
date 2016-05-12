//
//  FirstViewController.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-04-30.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import UIKit

class AnnouncementViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //Elemets on the Screen
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var menuButton: UIBarButtonItem!
    @IBOutlet weak var chatButton: UIBarButtonItem!

    //Temp variables
    var announcements: [[String]]? = []

    //First Load
    override func viewDidLoad() {
        //View Did Load
        super.viewDidLoad()

        announcements = Package.sharedInstance.announcements
        self.tableView.separatorColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha: 0.3)

        if revealViewController() != nil {

            revealViewController().rightViewRevealWidth = 300
            chatButton.target = revealViewController()
            chatButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))

            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

        //Refresh Controller
        let refreshControl = UIRefreshControl()     //Link-up
        tableView.dataSource = self                 //Connect Data-Source
        refreshControl.addTarget(self, action: #selector(AnnouncementViewController.refreshAnnouncements(_:)), forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)        //
    }

    //Load on each switch into view
    override func viewWillAppear(animated: Bool) {

    }

    //Local variables
    var students: JSON?

    //Functions
    func table_refresh() {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
    }

    func refreshAnnouncements(refreshControl: UIRefreshControl) {
        Package.sharedInstance.update()
        table_refresh()
        print("refresh announcements")
        refreshControl.endRefreshing()
    }

    //Table Specifications
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.announcements!.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! AnnouncementCell

        cell.title?.text = String(self.announcements![indexPath.row][0])
        cell.body?.text = String(self.announcements![indexPath.row][1])
        cell.card?.layer.borderWidth = 1
        cell.card?.layer.borderColor = UIColor(red:218.0/255.0, green:226.0/255.0, blue:228.0/255.0, alpha: 1.0).CGColor
        
        return cell
    }

}

