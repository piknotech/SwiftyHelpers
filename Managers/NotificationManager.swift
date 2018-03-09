//
//  NotificationManager.swift
//

import UIKit
import UserNotifications

/// Sends out notifications to the user.
/// To use it:
/// - Define your own notificationTitles, notificationBodies & sendIntervals
/// - Call NotificationManager.shared.setup() in app did finish launching
/// - Call NotificationManager.shared.resetBadge() in app did become active
/// - Call NotificationManager.shared.scheduleNotifications() in app did become active
class NotificationManager {
    // MARK: - Properties
    static let shared = NotificationManager()
    private let notificationTitles = [ // Populate this with your own texts
        "A title",
        "Another possible title",
        "Another title randomly chosen"
    ]

    private let notificationBodies = [ // Populate this with your own texts
        "A notification body",
        "A very long notification body that's long but may nonetheless be chosen for a message"
    ]

    /// Defines after how many days after the last visit a notification should be sent
    private let sendIntervals = [7, 21, 56]

    // MARK: - Initializers
    private init() { }

    // MARK: - Methods: Interaction
    /// Requests authorization for scheduling notifications
    func setup() {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { _, _ in }
        resetBadge()
        scheduleNotifications()
    }

    /// Sets the app's badge back to 0
    func resetBadge() {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }

    /// Removes old notification requests, adds new ones
    func scheduleNotifications() {
        // Remove old notification requests
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

        // Add new notification requests
        var notifications = [UNMutableNotificationContent]()
        for interval in sendIntervals {
            let newNotification = scheduleNotification(
                after: interval,
                withoutCopying: notifications
            )
            notifications.append(newNotification)
        }
    }

    // MARK: Helpers
    /// Schedules a notification. Returns the notification content.
    private func scheduleNotification(after days: Int, withoutCopying oldNotifications: [UNMutableNotificationContent] = []) -> UNMutableNotificationContent {
        // Create notification
        let notification = UNMutableNotificationContent()

        // Set title
        let titles = notificationTitles.filter { title in
            notificationTitles.count <= oldNotifications.count || !oldNotifications.contains { $0.title == title }
        }

        notification.title = titles[Int(arc4random_uniform(UInt32(titles.count)))]

        // Set body
        let bodies = notificationBodies.filter { body in
            notificationBodies.count <= oldNotifications.count || !oldNotifications.contains { $0.body == body }
        }

        notification.body = bodies[Int(arc4random_uniform(UInt32(bodies.count)))]

        // Configure badge & sound
        notification.badge = 1
        notification.sound = UNNotificationSound(named: "notification_sound.wav")

        // Create trigger
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(days * 24 * 60 * 60), repeats: false)

        // Create and add request
        let request = UNNotificationRequest(identifier: "notification\(days)", content: notification, trigger: notificationTrigger)
        UNUserNotificationCenter.current().add(request)

        // Return created notification
        return notification
    }
}
