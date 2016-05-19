//
//  LandingPageController.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-05-11.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import UIKit
import QuartzCore

class LandingPageController: UIViewController {
    
    //Icons

    @IBOutlet weak var passwordContainer: UIView!
    @IBOutlet weak var usernameContainer: UIView!
    @IBOutlet weak var passwordBox: UITextField!
    @IBOutlet weak var usernameBox: UITextField!
    @IBOutlet weak var usernameIcon: UILabel!
    @IBOutlet weak var passwordIcon: UILabel!
    @IBOutlet weak var signupIcon: UILabel!
    @IBOutlet weak var demoIcon: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameContainer.layer.borderWidth = 1
        usernameContainer.layer.borderColor = UIColor(colorLiteralRed: 52/255, green: 152/255, blue: 219/255, alpha: 1.0).CGColor
        
        passwordContainer.layer.borderWidth = 1
        passwordContainer.layer.borderColor = UIColor(colorLiteralRed: 52/255, green: 152/255, blue: 219/255, alpha: 1.0).CGColor
        

        
        usernameIcon.text = "\u{e001}"
        passwordIcon.text = "\u{e08e}"
        signupIcon.text = "\u{e065}"
        demoIcon.text = "\u{e042}"
    }
    
    
}
