//
//  AppDelegate.swift
//  Created by Srikanth on 01/01/23

import UIKit
import IQKeyboardManagerSwift

import Firebase
import FirebaseMessaging
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var orientationLock = UIInterfaceOrientationMask.portrait
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        makeApplicationSleep(ForNumberOfSeconds: 3)
        setIQKeyboardManager()
        
        initializeSwizzle()
        //configurePushNotifications(WithUIApplication: application)
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

// MARK: SetUpAppearance
extension AppDelegate {
    private func makeApplicationSleep(ForNumberOfSeconds seconds: UInt32) {
        sleep(seconds)
    }
    
    private func setIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
    }
    
    private func initializeSwizzle() {
        UIViewController.swizzle()
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return orientationLock
    }
}

// MARK: Push Notificaions
extension AppDelegate: MessagingDelegate, UNUserNotificationCenterDelegate {
    private func configurePushNotifications(WithUIApplication application: UIApplication) {
        FirebaseApp.configure()
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, _ in
            guard success else { return }
            DispatchQueue.main.async {
                application.registerForRemoteNotifications()
            }
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().delegate = self
        Messaging.messaging().apnsToken = deviceToken
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        messaging.token { token, _ in
            guard let apnsToken = token else { return }
            UserDefaultsHelper.setData(value: apnsToken, key: .apnsToken)
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if #available(iOS 14.0, *) {
            completionHandler([.banner, .badge, .sound])
        } else {
            completionHandler([.badge, .sound])
        }
    }
     
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
        let userInfo = response.notification.request.content.userInfo
        handlePushNotification(WithUserInfo: userInfo)
    }

    private func handlePushNotification(WithUserInfo userInfo: [AnyHashable : Any]) {
        if let notificationType = userInfo["type"] as? String {
            guard let _ = UserDefaultsHelper.getData(type: String.self, forKey: .apiToken) else { return }
            
            switch notificationType {
                case PushNotificationType.notifications.rawValue:
                    print("Navigate to NotificationsVC")
                    //NotificationsVC.push(storyboard: .notificationsSB)
                case PushNotificationType.settings.rawValue:
                    print("Navigate to SettingsVC")
                    //SettingsVC.push(storyboard: .settingsSB)
                default:
                    print("Invalid notification type")
            }
        }
    }
}
