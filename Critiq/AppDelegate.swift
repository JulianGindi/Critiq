//
//  AppDelegate.swift
//  Critiq
//
//  Created by Julian Gindi on 3/3/15.
//  Copyright (c) 2015 JulianGindi. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var menuBarController : MenuBarController?


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        menuBarController = MenuBarController.init()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func uploadClipboard() {
        println("uploading clipboard")
    }


}

