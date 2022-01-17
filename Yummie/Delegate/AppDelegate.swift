//
//  AppDelegate.swift
//  Yummie
//
//  Created by Abdallah on 1/15/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = .black
    }
    

}

