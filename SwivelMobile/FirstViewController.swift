//
//  FirstViewController.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-04-30.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import UIKit
import Alamofire


class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //Table Rendering
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request(.GET,"http://localhost:3000/teachers")
            .response { (request, response, data, error) in
                print(response)
                self.display.text = JSON(data: data!)[0]["name"].string
                print(error)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> {
        return 3
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return
    }


}

