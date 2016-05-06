//
//  dataStruct.swift
//  SwivelMobile
//
// Singleton data structure to store the expensive one time Request
//
//  Created by Jonathen Chen on 2016-05-05.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import Foundation
import Alamofire

class Package {
    static var sharedInstance = Package()
    private init() {}

    //JSON DATA
    var data: JSON?

    //Built in Update Method
    func update() {
      Alamofire.request(.GET,"http://localhost:3000/students")
            .response { (request, response, data, error) in
                self.data = JSON(data: data!)
            }
    }
}

