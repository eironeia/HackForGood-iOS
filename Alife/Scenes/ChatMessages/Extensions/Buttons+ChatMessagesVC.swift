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
//        let message = JSQMessage(senderId: senderId, senderDisplayName: senderDisplayName, date: date, text: text)
//        self.messages += [message]
//        self.finishSendingMessage()
        self.chatAPIStore.sendMessage(self.senderId, emergencyID: self.emergencyID, message: text) {}
    }
    
    override func didPressAccessoryButton(sender: UIButton!) {
        
    }
}