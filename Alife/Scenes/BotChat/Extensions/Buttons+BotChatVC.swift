//
//  Buttons+BotChatVC.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 10/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import Foundation
import Firebase
import JSQMessagesViewController


extension BotChat {
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {

        let message = JSQMessage(senderId: senderId, senderDisplayName: senderDisplayName, date: date, text: text)
        self.messages += [message]
        self.finishSendingMessage()
        
        self.botAPIStore.sendMessage(withText: text) { (answerText) in
            let message = JSQMessage(senderId: "-1", senderDisplayName: "Bot", date: date, text: answerText)
            self.messages += [message]
            self.finishReceivingMessage()
        }
        
    }
    
    override func didPressAccessoryButton(sender: UIButton!) {
        
    }
}