//
//  Buttons+ChatMessagesVC.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 05/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import Firebase
import JSQMessagesViewController


extension ChatMessages {
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {

        self.chatAPIStore.sendMessage(self.senderId, emergencyID: self.emergencyID, message: text) {}
        self.finishSendingMessage()
    }
    
    override func didPressAccessoryButton(sender: UIButton!) {
        
    }
}