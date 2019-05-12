//
//  AddAlarmViewController.swift
//  Chip- Hotel Booking Chatbot
//
//  Created by Ashna Chandra on 4/6/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import UserNotifications

class AddAlarmViewController: UIViewController {
    var alarm: Alarm?
    
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        timePicker.minimumDate = NSDate() as Date
        timePicker.locale = NSLocale.current
    }
    func checkDate()
    {
        if NSDate().earlierDate(timePicker.date) == timePicker.date
        {
            saveButton.isEnabled = false
        }
    }
    
    @IBAction func timeChanged(_ sender: UIDatePicker)
    {
        checkDate()
    }
    
    @IBAction func cancel(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func qqq(_ sender: Any) {
        
        Temp.shared.tempDate = timePicker.date
        Temp.shared.tempArray.append(timePicker.date)
        print("size: \(Temp.shared.tempArray.count)")
//        dismiss(animated: true, completion: nil)
        self.navigationController!.popViewController(animated: true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if sender as AnyObject? === saveButton
        {
            var time = timePicker.date
            let timeInterval = floor(time.timeIntervalSinceReferenceDate/60) * 60
            time = NSDate(timeIntervalSinceReferenceDate: timeInterval) as Date
            
            
            
        
            //notification
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound])
            {(success, error) in
                if error != nil {
                    print("Authorization Unsuccessful")
                }
                else {
                    print("Authorization Successful")
                }
            }
            
            
            
//
//            //new
//            let content = UNMutableNotificationContent()
//             content.title = "AlarmBot"
//             content.sound = UNNotificationSound.default()
//            let gregorian = Calendar(identifier: .gregorian)
//            let now = Date()
//            var components = gregorian.dateComponents([.year, .month, .day, .hour, .minute, .second], from: now)
//
//            // Change the time to 7:00:00 in your locale
//            components.hour = 7
//            components.minute = 0
//            components.second = 0
//
//            let date = gregorian.date(from: components)!
//
//            let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: date)
//            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
//
//            let uuidString = UUID().uuidString
//            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
//            print("INSIDE NOTIFICATION")
//
//            UNUserNotificationCenter.current().add(request, withCompletionHandler: {(error) in
//            if let error = error {
//            print("SOMETHING WENT WRONG")
//            }
//            })
//            alarm = Alarm(time: time as NSDate, notification: Notification)
//            
//            let content = UNMutableNotificationContent()
//            content.title = "AlarmBot"
//            content.sound = UNNotificationSound.default()
//           //UIApplication.shared.scheduleLocalNotification(content)
//
//            let date = Date(timeIntervalSinceNow: 3600)
//            let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
//
//            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
//
//            alarm = Alarm(time: time as NSDate, notification: notification)
//
//
//
//
//
//            let notification = UILocalNotification()
//            notification.alertTitle = "AlarmBot"
//            notification.soundName = UILocalNotificationDefaultSoundName
//
//            UIApplication.shared.scheduleLocalNotification(notification)
//
//            alarm = Alarm(time: time as NSDate, notification: notification)
//
 
  
            
        }
        
    }
    
    

}
