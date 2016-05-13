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
    @IBOutlet weak var schoolImage: UIImageView!

    var courses: [String]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        courses = Package.sharedInstance.courses
        schoolImage.layer.cornerRadius = 3
        schoolImage.layer.masksToBounds = true
        schoolImage.layer.borderWidth = 1
        schoolImage.layer.borderColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.5).CGColor

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return courses!.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MenuCourseCell
        //cell.courseIcon?.image = UIImage(named:"arrow_logo")
        cell.courseTitle?.text = String(self.courses![indexPath.row])
        return cell
    }


}
