//
//  ChatMenuController.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-05-17.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import UIKit

class ChatMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //Elements on the View
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Table Sepcifications
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ChatMenuCell
        cell.profileImage.image = UIImage(named: "bonnie")
        cell.username.text = "Bonnie Lohman"
        cell.latestMessage.text = "Have you submitted the assignment?"
        cell.statusIcon.text = "\u{e050}"
        cell.timeStamp.text = "40mins" + " ago"
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("hey you clicked this shit")
    }
    
}
