//
//  instantiate+ViewController.swift
//  Enigma
//
//  Created by Devang Patel on 23/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn

extension AppDelegate {
    
    // Function setting up intial view controller
    func setInitialViewController() {
        
        // app delegate setup
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Get UID function
        print(getUID())
        
        let loginstatus = UserDefaults.standard.bool(forKey: "login")
        let goTo = UserDefaults.standard.string(forKey: "goTo")
        print("Login status=\(loginstatus)")
        if loginstatus == false {
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                GIDSignIn.sharedInstance().signOut()
                print("SignOut sucessful")
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            let VC = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") 
            appDelegate.window?.rootViewController = VC
            appDelegate.window?.makeKeyAndVisible()
        }
        else if loginstatus == true && goTo == "toTab1" {
            let tap = mainStoryboard.instantiateViewController(withIdentifier: "toTab1") as! UITabBarController
            appDelegate.window?.rootViewController = tap
            appDelegate.window?.makeKeyAndVisible()
        }
        else if loginstatus == true && goTo == "toTab2" {
            let tap = mainStoryboard.instantiateViewController(withIdentifier: "toTab2") as! UITabBarController
            appDelegate.window?.rootViewController = tap
            appDelegate.window?.makeKeyAndVisible()
        }
        
    }
    
}

