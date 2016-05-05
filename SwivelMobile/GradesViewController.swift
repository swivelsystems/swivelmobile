//
//  SecondViewController.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-04-30.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import UIKit

class GradesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //Table Rendering
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

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

