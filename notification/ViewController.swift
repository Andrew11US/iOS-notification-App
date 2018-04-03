//
//  ViewController.swift
//  notification
//
//  Created by Andrew on 4/3/18.
//  Copyright © 2018 Andrii Halabuda. All rights reserved.
//

import UIKit
import NotificationCenter
import UserNotifications

class ViewController: UIViewController {

    let center = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestNotificationAuthorization(notificationCenter: center)
        presentNotification(title: "Hello", subtitle: "Again", body: "message", interval: 5, repeats: false)
        
    }
    
    func presentNotification(title: String, subtitle: String, body: String, interval: TimeInterval, repeats: Bool) {
        
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.sound = UNNotificationSound.default()
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: repeats)
        
        let request = UNNotificationRequest(identifier: "contentId", content: content, trigger: trigger)
        
        center.add(request) { (error) in
            if error != nil {
                debugPrint("Error: \(error.debugDescription)")
            }
        }
    }
    
    func requestNotificationAuthorization(notificationCenter: UNUserNotificationCenter) {
        
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (result, error) in
            
            if error != nil {
                debugPrint("Error occured: \(error.debugDescription)")
            }
        }
    }


}

