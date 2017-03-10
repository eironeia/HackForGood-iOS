//
//  ChatMessagesViewController.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 05/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import Firebase
import JSQMessagesViewController

class ChatMessages: JSQMessagesViewController {
    
    var chatAPIStore:ChatAPI = ChatAPI()
    var botAPIStore: BotAPIStore  = BotAPIStore()
    var emergencyID:String!
    
    let incomingBubble = JSQMessagesBubbleImageFactory().incomingMessagesBubbleImageWithColor(UIColor(red: 10/255, green: 180/255, blue: 230/255, alpha: 1.0))
    let outgoingBubble = JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImageWithColor(UIColor.lightGrayColor())
    var messages = [JSQMessage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setup()
        self.observeMessages()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func observeMessages() {
        
//        chatAPIStore.getMessages(self.emergencyID) { (message) in
//        
//            let newMessage = JSQMessage(senderId: message.senderID, displayName: message.senderName, text: message.content)
//            self.messages += [newMessage]
//            self.finishSendingMessage()
//        }
    }
    
    func setup() {
        self.senderId = (FIRAuth.auth()?.currentUser?.uid)!
        self.senderDisplayName = UIDevice.currentDevice().identifierForVendor?.UUIDString
        
        collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
        collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
    }
}
