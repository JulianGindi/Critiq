//
//  AppDelegate.swift
//  Critiq
//
//  Created by Thomas Degry and Julian Gindi on 3/3/15.
//  Copyright (c) 2015 Thomas Degry and Julian Gindi. All rights reserved.
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
        let clipboard = NSPasteboard.generalPasteboard()
        let outputArray = [url]
        clipboard.clearContents()
        clipboard.writeObjects(outputArray)
        
        // Send out notification to change icon again
        NSNotificationCenter.defaultCenter().postNotificationName("DID_UPLOAD", object: nil)
        
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
        notification.informativeText = "The URL of your snippet has been copied to your clipboard"
        notification.hasActionButton = true
        var center:NSUserNotificationCenter = NSUserNotificationCenter.defaultUserNotificationCenter()
        
        center.delegate = self
        center.scheduleNotification(notification)
    }
    
    func notify (center: NSUserNotificationCenter, didActivateNotification notification: NSUserNotification){
        center.delegate = self
        println("clicked")  //this does not print
    }
}

