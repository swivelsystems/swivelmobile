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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MenuCourseCell
        cell.courseIcon?.image = UIImage(named:"arrow_logo")
        cell.courseTitle?.text = "Some course"
        return cell
    }


}
