//
//  dataStruct.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-05-05.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import Foundation

class Package {
    static var sharedInstance = Package()
    var something = "the thing"
    var data: JSON?
    private init() {}
}