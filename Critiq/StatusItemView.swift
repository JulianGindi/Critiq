//
//  StatusItemView.swift
//  Critiq
//
//  Created by Thomas Degry and Julian Gindi on 3/8/15.
//  Copyright (c) 2015 Thomas Degry and Julian Gindi. All rights reserved.
//

import Cocoa

enum iconStates {
    case iconStateUploading
    case iconStateNormal
}

class StatusItemView: NSView {
    var image : NSImage?
    var isHighlighted:Bool = false {
        didSet {
            self.display()
        }
    }

    var isUploading:Bool = false
    var target:AnyObject?
    var action:Selector?
    var iconState:iconStates = iconStates.iconStateNormal {
        didSet {
            self.display()
        }
    }
    var statusItem: NSStatusItem? {
        didSet {
            self.setUp()
        }
    }
    
    var settingsWindow = SettingsWindowController()

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        
        // Fetch Mac's settings on style
        let style = NSUserDefaults.standardUserDefaults().stringForKey("AppleInterfaceStyle")
      
        switch self.iconState {
        case iconStates.iconStateNormal:
            if style == "Dark" {
                self.image = NSImage(named: "icon-light")
            } else {
                self.image = NSImage(named: "icon")
            }
            break;
            
        case iconStates.iconStateUploading:
            if style == "Dark" {
                self.image = NSImage(named: "light-uploading")
            } else {
                self.image = NSImage(named: "dark-uploading")
            }
            break;
        }
        
        
        let icon = self.image
        let size = icon?.size
        let bounds = self.bounds
        
        let iconX:CGFloat = (bounds.width - size!.width) / 2
        let iconY:CGFloat = (bounds.height - size!.height) / 2
        
        let iconPoint = NSMakePoint(iconX, iconY)
        
        icon?.drawAtPoint(iconPoint, fromRect: NSZeroRect, operation: NSCompositingOperation.CompositeSourceOver, fraction: 1.0)
    }
    
    func setUp() {
        self.statusItem?.view = self

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didFinishUploading:", name: "DID_UPLOAD", object: nil)
    }
    
    func didFinishUploading(notification:NSNotification) {
        self.iconState = iconStates.iconStateNormal
    }
    
    override func mouseDown(theEvent: NSEvent) {
        // First check to see if the right mouse button was used
        let clickMask = Int(theEvent.modifierFlags.rawValue) & Int(NSEventModifierFlags.ControlKeyMask.rawValue)
        if clickMask != 0 {
            println("Clicked with Control")
            settingsWindow.view!.orderFront(self)
        } else {
            self.iconState = iconStates.iconStateUploading
            NSApp.sendAction(self.action!, to: self.target, from: self)
            self.isHighlighted = true
        }
    }
}
