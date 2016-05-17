//
//  SocketIOManager.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-05-09.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import UIKit

class SocketIOManager: NSObject {
    static let sharedInstance = SocketIOManager()
    
    //connect to the website
    var socket: SocketIOClient = SocketIOClient(socketURL: NSURL(string: "http://localhost:8080")!)
    
    //connection
    func establishConnection() {
        socket.connect()
    }
    
    //disconnection method
    func closeConnection() {
        socket.disconnect()
    }
    
    //initialization
    override init() {
        super.init()
    }
    
    
}
