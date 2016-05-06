//
//  FirstViewController.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-04-30.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import UIKit
import Alamofire
import CoreData


class AnnouncementViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //Table Rendering
    @IBOutlet weak var tableView: UITableView!
    
    var studentId = "1234"

    var students: JSON?

    func table_refresh() {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        tableView.dataSource = self
        refreshControl.addTarget(self, action: "refreshAnnouncements:", forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)
        print(package.students)

        Alamofire.request(.GET,"http://localhost:3000/students/:" + studentId)
            .response { (request, response, data, error) in
                struct package {
                    
                }
                self.students = JSON(data: data!)
                self.table_refresh()
        }
    }
    
    func refreshAnnouncements(refreshControl: UIRefreshControl) {
        print("refresh announcements")
        refreshControl.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

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

