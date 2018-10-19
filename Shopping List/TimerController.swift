import UIKit
import UserNotifications

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let times = [5, 10, 15, 60]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return times.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(times[row]) seconds"
    }
    
    @IBOutlet weak var notificationField: UITextField!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func schedule(_ sender: Any) {
        
        // Build the content
        guard let text = notificationField.text, !text.isEmpty else { return }
        let content = UNMutableNotificationContent()
        content.title = "Notification!"
        content.body = text
        
        // set the time for triggering the notifcation
        let timeInterval = Double(times[pickerView.selectedRow(inComponent: 0)])
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        // Build request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        // schdule the notification
        let center = UNUserNotificationCenter.current()
        center.add(request) {error in
            if let error = error {
                NSLog("Error scheduling notification: \(error) ")
                return
            }
            NSLog("Notification scheduled for \(timeInterval) secounds in the future")
        }
    }
}

