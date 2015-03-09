//
//  SettingsWindowView.swift
//  Critiq
//
//  Created by Thomas Degry and Julian Gindi on 3/9/15.
//  Copyright (c) 2015 Thomas Degry and Julian Gindi. All rights reserved.
//

import Cocoa

class SettingsWindowView: NSWindow {

    @IBOutlet weak var duration: NSPopUpButton!
    @IBOutlet weak var language: NSPopUpButton!
    
    @IBAction func durationChange(sender: AnyObject) {
    }
    
    @IBAction func languageChange(sender: AnyObject) {
    }
}
