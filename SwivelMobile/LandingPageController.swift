//
//  LandingPageController.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-05-11.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import UIKit

class LandingPageController: UIViewController {
    
    //Icons

    @IBOutlet weak var passwordBox: UITextField!
    @IBOutlet weak var usernameBox: UITextField!
    @IBOutlet weak var usernameIcon: UILabel!
    @IBOutlet weak var passwordIcon: UILabel!
    @IBOutlet weak var signupIcon: UILabel!
    @IBOutlet weak var demoIcon: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordBox.layer.borderWidth = 1
        passwordBox.layer.borderColor = UIColor(red:12/255.0, green:12/255.0, blue:12/255.0, alpha: 1.0).CGColor
        passwordBox.layer.borderWidth = 1
        usernameBox.layer.borderColor = UIColor(red:12/255.0, green:12/255.0, blue:12/255.0, alpha: 1.0).CGColor
        usernameIcon.text = "\u{e001}"
        passwordIcon.text = "\u{e08e}"
        signupIcon.text = "\u{e065}"
        demoIcon.text = "\u{e042}"
    }
    
    
}
