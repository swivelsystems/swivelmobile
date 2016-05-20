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
    var socket: SocketIOClient = SocketIOClient(socketURL: NSURL(string: "http://swivelsystems.org")!)
    
    //connection
    func establishConnection() {
        socket.connect()
        socket.on("authenticate") { (dataArray, ack) -> Void in
            self.socket.emit("authenticated", Package.sharedInstance.username, Package.sharedInstance.id)
        }
    }
    
    func sendMessage(message:String, recipientName:String, recipientId:String) {
        let package = [Package.sharedInstance.username, message, recipientName, "",Package.sharedInstance.id,"student", recipientId, "teacher"]
        print(package)
        socket.emit("newMessage", package)
        
    }
    
    func getMessage(completionHandler: (messageInfo: [String: AnyObject]) -> Void) {
        socket.on("newMessage") { (dataArray, socketAck) -> Void in
            var messageDictionary = [String: AnyObject]()
            //print(dataArray)
            let data = dataArray[0] as! NSMutableArray
            print(data[1],data[2],data[7])
            messageDictionary["username"] = data[0]
            messageDictionary["message"] = data[1]
            messageDictionary["date"] = data[8]
            completionHandler(messageInfo: messageDictionary)
        }
    }
    
    func loadMessage() {
        socket.emit("loadMessages")
    }
    
    func listenMessage(completionHandler: (messages: [AnyObject]) -> Void) {
        socket.on("messages") { (messagesArray, Ack) -> Void in
            completionHandler(messages: messagesArray)
        }
    }

    
    //func getMessage()
    
    //disconnection method
    func closeConnection() {
        socket.emit("disconnect")
        socket.disconnect()
    }
    
    //initialization
    override init() {
        super.init()
    }
    
}
