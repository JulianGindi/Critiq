//
//  SettingsWindowController.swift
//  
//
//  Created by Thomas Degry and Julian Gindi on 3/9/15.
//
//

import Cocoa

class SettingsWindowController: NSWindowController {
    let settingsWindow : SettingsWindowView = SettingsWindowView()

    override func windowDidLoad() {
        super.windowDidLoad()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(window: NSWindow) {
        super.init(window: settingsWindow)
    }
}
