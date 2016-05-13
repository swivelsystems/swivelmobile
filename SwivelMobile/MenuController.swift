//
//  MenuController.swift
//  SidebarMenu
//
//  Created by Simon Ng on 2/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {

    @IBOutlet weak var announcementIcon: UILabel!
    
    @IBOutlet weak var deadlineIcon: UILabel!
    @IBOutlet weak var gradeIcon: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        announcementIcon.text = "\u{e075}"
        deadlineIcon.text = "\u{e081}"
        gradeIcon.text = "\u{e04c}"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
