//
//  FirstViewController.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-04-30.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import UIKit
import Alamofire

class AnnouncementViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //Elemets on the Screen
    @IBOutlet weak var tableView: UITableView!

    //First Load
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Package.sharedInstance.data)
        let refreshControl = UIRefreshControl()
        tableView.dataSource = self
        refreshControl.addTarget(self, action: "refreshAnnouncements:", forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)
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
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! AnnouncementCell
        cell.photo.image = UIImage(named:"Haomeme")
        //cell.name?.text = students?[indexPath.row]["name"]["first"].string!
        //cell.email?.text = students?[indexPath.row]["email"].string!
        return cell
    }

}

