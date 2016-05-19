//
//  ChatController.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-05-17.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate, UIGestureRecognizerDelegate {
    
    //Segue needs to set this information
    var targetUser = "Jonathen"
    var targetUserId = "30"

    var chatMessages = [[String: AnyObject]]()
    
    
    //Temp Variables
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var scrollBox: UIScrollView!
    @IBOutlet weak var inputBar: UIView!
    
    @IBOutlet weak var messageField: UITextField!

    //Sends the Message
    @IBAction func sendMessage(sender: AnyObject) {
        if messageField.text!.characters.count > 0 {
            SocketIOManager.sharedInstance.sendMessage(messageField.text!, recipientName:self.targetUser, recipientId:self.targetUserId)
            messageField.text = ""
            messageField.resignFirstResponder()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        SocketIOManager.sharedInstance.loadMessage()
//        SocketIOManager.sharedInstance.listenMessage{(messages) -> Void in
//            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                self.chatMessages.append(messages)
//                self.tableView.reloadData()
//                self.scrollToBottom()
//            })
//        }
        self.backButton.setTitle("\u{e07a}", forState: .Normal)
        let topBorder: CALayer = CALayer()
        topBorder.frame = CGRectMake(0.0, 0.0, inputBar.frame.size.width, 1.0)
        topBorder.backgroundColor = UIColor(colorLiteralRed: 218/255, green: 226/255, blue: 228/255, alpha: 1.0).CGColor
        inputBar.layer.addSublayer(topBorder)
        
        //Dismiss Keyboard
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ChatViewController.dismissKeyboard))
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Down
        swipeGestureRecognizer.delegate = self
        view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //messageField.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        SocketIOManager.sharedInstance.getMessage {(messageInfo) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.chatMessages.append(messageInfo)
                self.tableView.reloadData()
                self.scrollToBottom()
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollToBottom() {
        let delay = 0.1 * Double(NSEC_PER_SEC)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay)), dispatch_get_main_queue()) { () -> Void in
            if self.chatMessages.count > 0 {
                let lastRowIndexPath = NSIndexPath(forRow: self.chatMessages.count - 1, inSection: 0)
                self.tableView.scrollToRowAtIndexPath(lastRowIndexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
            }
        }
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    
    func dismissKeyboard() {
        if messageField.isFirstResponder() {
            messageField.resignFirstResponder()
            //SocketIOManager.sharedInstance.sendStopTypingMessage(nickname)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! IncomingMessageCell
        
        let currentChatMessage = chatMessages[indexPath.row]
        
        let senderUsername = currentChatMessage["username"] as! String
        let message = currentChatMessage["message"] as! String
        let messageDate = currentChatMessage["date"] as! String
        
        //if user is the sender
        if senderUsername == Package.sharedInstance.username {
            cell.message.textColor = UIColor.whiteColor()
            cell.timeStamp.textColor = UIColor.whiteColor().colorWithAlphaComponent(0.8)
            cell.message.textAlignment = NSTextAlignment.Right
            cell.timeStamp.textAlignment = NSTextAlignment.Right
            cell.container.backgroundColor = UIColor(colorLiteralRed: 46/255, green: 204/255, blue: 113/255, alpha: 0.8)
            cell.container.layer.borderColor = UIColor(colorLiteralRed: 46/255, green: 204/255, blue: 113/255, alpha: 0.8).CGColor
        }
        cell.container.layer.borderWidth = 1
        cell.container.layer.cornerRadius = 12
        
        cell.message.text = message
        cell.timeStamp.text = senderUsername + " | " + messageDate
        
        return cell
    }
    
    
}
