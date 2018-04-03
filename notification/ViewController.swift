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
    let content = UNMutableNotificationContent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (result, error) in
            
            if error != nil {
                debugPrint("Error occured: \(error.debugDescription)")
            }
        }
        
        
        center.add(presentNotification(content: content)) { (error) in
            if error != nil {
                print("error \(String(describing: error))")
            }
        }
    }
    
    //create the content for the notification
//    let content = UNMutableNotificationContent()
    
    func presentNotification(content: UNMutableNotificationContent) -> UNNotificationRequest {
        
        content.title = " Jurassic Park"
        content.subtitle = "Lunch"
        content.body = "Its lunch time at the park, please join us for a dinosaur feeding"
        content.sound = UNNotificationSound.default()
        
//        trigger = UNTimeIntervalNotificationTrigger(timeInterval:2.0, repeats: false)
        
        return UNNotificationRequest(identifier: "ContentIdentifier", content: content, trigger: UNTimeIntervalNotificationTrigger(timeInterval:2.0, repeats: false))
    }
    
    
    //notification trigger can be based on time, calendar or location
//    let trigger = UNTimeIntervalNotificationTrigger(timeInterval:2.0, repeats: false)
    
    //create request to display
//    let request = UNNotificationRequest(identifier: "ContentIdentifier", content: content, trigger: trigger)
    
    //add request to notification center
//    center.add(request) { (error) in
//    if error != nil {
//    print("error \(String(describing: error))")
//    }
//    }


}

