//
//  Notification.swift
//  vovy
//
//  Created by Peter Andrew on 25/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class Notification:NSObject, UNUserNotificationCenterDelegate {
    
    let options: UNAuthorizationOptions = [.alert, .sound, .badge]
    let notificationCenter = UNUserNotificationCenter.current()
    static var instance:Notification?
    
    static func getInstance() -> Notification {
        if let fetchInstance = instance{
            return fetchInstance
        } else {
            instance = Notification()
            return instance!
        }
    }
    
    func notificationConfig() {
        requestNotificationAuth()
    }
    
    func requestNotificationAuth() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) {
           [weak self] granted, error in
              
            print("Permission granted: \(granted)")
            guard granted else { return }
            self?.getNotificationSettings()
        }
    }
    func getNotificationSettings() {
      notificationCenter.getNotificationSettings { settings in
        guard settings.authorizationStatus == .authorized else { return }
        DispatchQueue.main.async {
          UIApplication.shared.registerForRemoteNotifications()
        }
      }
    }
}
