//
//  LocalNotifications.swift
//  Teshames
//
//  Created by Muna Aiman Al-hajj on 30/03/1445 AH.
//

import SwiftUI
import UserNotifications

class NotificationManager{
    
    static let instance = NotificationManager()
    func requestAuthrization(){
        let options : UNAuthorizationOptions = [.alert, .badge , .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR: \(error)")
            } else{
                print ("SUCCESS")
            }
        }
    }
    func schedualeNotification(){
        let content = UNMutableNotificationContent()
        content.title = " 🌤️ تـشـمّــش "
        content.subtitle = "Its time to get Vitamen D"
        content.sound = .default
        content.badge = 1
        
        //time
        // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        //calender
        //morningNotifications
        var dateComponents = DateComponents()
        dateComponents.hour = 17
        dateComponents.minute = 10
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification(){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
}


enum NotificationAction: String {
    case dimiss
    case reminder
}

enum NotificationCategory: String {
    case general
}

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let userInfo = response.notification.request.content.userInfo
        print(userInfo); completionHandler()
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }
    
}

struct LocalNotifications: View {
    var body: some View {
        VStack {
          /* Button("."){
                NotificationManager.instance.schedualeNotification()
            }*/
            
         /* Button(""){

                let center = UNUserNotificationCenter.current()
                
                // create content
                let content = UNMutableNotificationContent()
                content.title = "Hot Coffee"
                content.body =  "Your delicious coffee is ready!"
                content.categoryIdentifier = NotificationCategory.general.rawValue
                content.userInfo = ["customData": "Some Data"]
                
                if let url = Bundle.main.url(forResource: "coffee", withExtension: "png") {
                    if let attachment = try? UNNotificationAttachment(identifier: "image", url: url, options: nil) {
                        content.attachments = [attachment]
                    }
                }
                
                // create trigger
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
                
                // create request
                let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: trigger)
                
                // define actions
                let dismiss = UNNotificationAction(identifier: NotificationAction.dimiss.rawValue, title: "Dismiss", options: [])
                
                let reminder = UNNotificationAction(identifier: NotificationAction.reminder.rawValue, title: "Reminder", options: [])
                
                let generalCategory = UNNotificationCategory(identifier: NotificationCategory.general.rawValue, actions: [dismiss, reminder], intentIdentifiers: [], options: [])
                
                center.setNotificationCategories([generalCategory])
                
                // add request to notification center
                center.add(request) { error in
                    if let error = error {
                        print(error)
                    }
                }
            
            }*/
        }
    }
}
#Preview {
    LocalNotifications()
}
