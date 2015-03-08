//
//  AppDelegate.swift
//  Critiq
//
//  Created by Julian Gindi on 3/3/15.
//  Copyright (c) 2015 JulianGindi. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, APIHelperDelegate, NSUserNotificationCenterDelegate {
    var menuBarController : MenuBarController?
    var apiHelper:APIHelper?

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        self.apiHelper = APIHelper()
        self.apiHelper?.delegate = self;
        menuBarController = MenuBarController.init()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func uploadClipboard() {
        let content = getMostRecentClipboardContents()
        if content != "" {
            self.apiHelper?.makeRequest(content)
        }
    }
    
    func didReceiveUrl(url: String) {
        // We will copy url to clipboard
        println(url)
        let clipboard = NSPasteboard.generalPasteboard()
        let outputArray = [url]
        clipboard.clearContents()
        clipboard.writeObjects(outputArray)
        // Now display a notification
        displayNotification()
        
    }
    
    func getMostRecentClipboardContents() -> String {
        let clipboard = NSPasteboard.generalPasteboard()
        let contents = clipboard.stringForType(NSPasteboardTypeString)
        if let actualContent = contents {
            return actualContent
        }
        return ""
    }
    
    func displayNotification() {
        let notification = NSUserNotification()
        
        notification.title = "Critiq Upload"
        notification.informativeText = "Your code has been uploaded"
        notification.hasActionButton = true
        var center:NSUserNotificationCenter = NSUserNotificationCenter.defaultUserNotificationCenter()
        
        //center.delegate = self
        center.delegate = self
        center.scheduleNotification(notification)
    }
    
    func notify (center: NSUserNotificationCenter, didActivateNotification notification: NSUserNotification){
        center.delegate = self
        println("clicked")  //this does not print
    }
}

