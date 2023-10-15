//
//  TeshamesApp.swift
//  Teshames
//
//  Created by sumaiya on 04/10/2566 BE.
//

import SwiftUI

@main
struct TeshamesApp: App {
    private var delegate: NotificationDelegate = NotificationDelegate()
           
           init() {
               let center = UNUserNotificationCenter.current()
               center.delegate = delegate
               center.requestAuthorization (options: [.alert, .sound, .badge]) { result, error in
                   if let error = error {
                       print(error)
                   }
               }
           }
    var body: some Scene {
        WindowGroup {
            SplashScreen()
            LocalNotifications()
        }
    }
}
