//
//  SecondViewController.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-04-30.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import UIKit

class GradesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //Temp Variables 
    
    var grade = 85.0;
    
    //Initial Loads
    override func viewDidLoad() {
        super.viewDidLoad()
        changeCircle(newAngle(grade))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func newAngle(grade: Double) -> Double {
     return grade/100 * 360
    }
    
    func changeCircle(newAngle: Double) {
        circularOverallGrade.animateToAngle(newAngle, duration: 1, completion: nil)
    }
    
    //View Rendering

    //Circle Rendering
    @IBOutlet weak var circularOverallGrade: KDCircularProgress!
    
    //Table Rendering
    @IBOutlet weak var tableView: UITableView!



    //Table Rendering functions
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! GradesCell
          cell.course?.text = "SOME COURSE"
          cell.teacher?.text = "MRS. Vickies"
          cell.average?.text = "75%"
          cell.grade?.text = "84%"
//            cell.course?.text = "Computer Science 101"
//            cell.teacher?.text = "Mrs. AppleBees"
//            //cell.studentAverage?.text = "75%"
//            cell.grade?.text = "87%"
        return cell
    }


}

