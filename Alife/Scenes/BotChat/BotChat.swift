//
//  BotChat.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 10/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import Firebase
import JSQMessagesViewController

class BotChat: JSQMessagesViewController {
    
    var botAPIStore: BotAPIStore  = BotAPIStore()
    
    
    let incomingBubble = JSQMessagesBubbleImageFactory().incomingMessagesBubbleImageWithColor(UIColor(red: 10/255, green: 180/255, blue: 230/255, alpha: 1.0))
    let outgoingBubble = JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImageWithColor(UIColor(red:0.26, green:0.33, blue:0.37, alpha:1.0))
    var messages = [JSQMessage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setup()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func setup() {
        self.senderId = (FIRAuth.auth()?.currentUser?.uid)!
        self.senderDisplayName = UIDevice.currentDevice().identifierForVendor?.UUIDString
        
        collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
        collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
    }
}













