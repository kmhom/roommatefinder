//
//  AppDelegate.swift
//  SimpleApp
//
//  Created by Kevin Hom on 10/9/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit
import GoogleSignIn


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GIDSignIn.sharedInstance()?.clientID = "338754776279-kkbp8m417i21p98pa05kl1pjm5mbr87k.apps.googleusercontent.com"
//        GIDSignin.sharedInstance()?.clientID = "com.googleusercontent.apps.338754776279-kkbp8m417i21p98pa05kl1pjm5mbr87k"
        GIDSignIn.sharedInstance()?.delegate = self
        if(GIDSignIn.sharedInstance().hasPreviousSignIn()){ //if user is signed in, don't show start screen
            let sb = UIStoryboard(name: "Main", bundle: nil)
            if let basicProfileVC = sb.instantiateViewController(withIdentifier: "BasicProfileViewController") as? UIViewController{
                window?.rootViewController = basicProfileVC
                self.window?.makeKeyAndVisible()
                
            }
        }
        return true
    }
    
    //sign in handler/ connect handler
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!){
        if let error = error{
            if(error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have signed out since then.")
            }
            else{
                print("\(error.localizedDescription)")
            }
            NotificationCenter.default.post(name: Notification.Name(rawValue: "ToggleAuthUINotification"), object:nil,userInfo: nil)
            return
        }
        let userID = user.userID //only for client side
        let idToken = user.authentication.idToken //can send directly to server
        let fullName = user.profile.name
        let givenName = user.profile.givenName
        let familyName = user.profile.familyName
        let email = user.profile.email
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ToggleAuthUINotification"),object:nil, userInfo: ["statusText": "Signed in user: \n\(fullName!)"])
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let basicProfileVC = sb.instantiateViewController(withIdentifier: "BasicProfileViewController") as? UIViewController{
            window?.rootViewController = basicProfileVC
            self.window?.makeKeyAndVisible()
        }
    }
    
    //disconnect handler
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!){
        print("The user has disconnected from the app\n")
        NotificationCenter.default.post(
             name: Notification.Name(rawValue: "ToggleAuthUINotification"),
             object: nil,
             userInfo: ["statusText": "User has disconnected."])
    }
    
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool{
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    //for ios 8.0
    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}


