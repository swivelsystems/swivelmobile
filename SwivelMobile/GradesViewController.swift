//
//  SecondViewController.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-04-30.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import UIKit

//Alias
let data = Package.sharedInstance
var grade: Double? = data.average

class GradesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    //Elements on Screen
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var chatButton: UIBarButtonItem!
    @IBOutlet weak var textGrade: UILabel!
    @IBOutlet weak var circularOverallGrade: KDCircularProgress!
    @IBOutlet weak var tableView: UITableView!

    //Initial Loads
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            revealViewController().rightViewRevealWidth = 300
            chatButton.target = revealViewController()
            chatButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))

            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

        let refreshControl = UIRefreshControl()
        tableView.dataSource = self
        refreshControl.addTarget(self, action: #selector(GradesViewController.refreshGrades(_:)), forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)
    }

    //Load on each switch into view
    override func viewWillAppear(animated: Bool) {
        changeGrade(grade!)
        super.viewWillAppear(animated)
    }



    //Local Variables
    //var grade = 85.0

    //Functions
    func refreshGrades(refreshControl: UIRefreshControl) {
        Package.sharedInstance.update()
        //Table refresh
        print("Grades Refreshed")
        refreshControl.endRefreshing()
    }


    func newAngle(grade: Double) -> Double {
     return grade/100 * 360
    }

    func changeGrade(newGrade: Double) {
        let angle = newAngle(newGrade)
        circularOverallGrade.animateFromAngle(0, toAngle: angle, duration: 0.5, completion: nil)
       // circularOverallGrade.animateFromAngle(angle, duration: 1, completion: nil)
        textGrade.text = String(round(100*newGrade)/100) + " %"
    }

    //Table Specfications
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! GradesCell
        if ((Package.sharedInstance.data?["courses"][indexPath.row]["name"])! != nil) {
          cell.course?.text = data.courses[indexPath.row]
          cell.grade?.text = String(data.grades[indexPath.row]) + "%"
        } else {
          cell.course?.text = ""
          cell.grade?.text = ""
        }
        return cell
    }

}

