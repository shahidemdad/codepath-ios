//
//  AppDelegate.swift
//  Quantum Meditations
//
//  Created by Shahid on 11/27/20.
//

import UIKit
import Parse // parse is already downloaded

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //copied from codepath
        //connect to my parse server
        //steps are here:
        //  https://guides.codepath.org/ios/Configuring-a-Parse-Server#2-setting-a-new-parse-server
        
        let parseConfig = ParseClientConfiguration {
                $0.applicationId = "b23y43mIcTYnRA63lXkkdsK1ZR7Agsmd5ZqhEoKM" // Updated ID from parse
                $0.clientKey = "Lsm9JxbJtxHpDj08J1vIdIJq8yITMCCqETdBJ4Gq" // Updated clientkey from parse
                $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: parseConfig)
        
        // --- end copy
        
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

