//
//  MainMenuController.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-05-10.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import UIKit

class MainMenuController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    //View Elements
    @IBOutlet weak var tableView: UITableView!

    var courses: [String]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        courses = Package.sharedInstance.courses

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return courses!.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MenuCourseCell
        cell.courseIcon?.image = UIImage(named:"arrow_logo")
        cell.courseTitle?.text = String(self.courses![indexPath.row])
        return cell
    }


}
