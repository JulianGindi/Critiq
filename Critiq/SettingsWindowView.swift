//
//  SettingsWindowView.swift
//  Critiq
//
//  Created by Thomas Degry and Julian Gindi on 3/9/15.
//  Copyright (c) 2015 Thomas Degry and Julian Gindi. All rights reserved.
//

import AppKit

class SettingsWindowView: NSWindow {
    
    let managedObjectContext = (NSApplication.sharedApplication().delegate as AppDelegate).managedObjectContext

    @IBOutlet weak var duration: NSPopUpButton!
    @IBOutlet weak var language: NSPopUpButton!
    
    
    @IBAction func durationChange(sender: AnyObject) {
        println("Duration Changed")
        println(managedObjectContext)
    }
    
    @IBAction func languageChange(sender: AnyObject) {
    }
}
