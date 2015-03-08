//
//  MenubarController.swift
//  Critiq
//
//  Created by Thomas Degry and Julian Gindi on 3/8/15.
//  Copyright (c) 2015 Thomas Degry and Julian Gindi. All rights reserved.
//

import AppKit



class MenuBarController:NSObject {
    let statusBar = NSStatusBar.systemStatusBar()
    let statusBarItem : NSStatusItem?
    let statusItemView : StatusItemView?
    
    override init() {
        statusBarItem = statusBar.statusItemWithLength(24.0)
        self.statusItemView = StatusItemView()
        self.statusItemView?.action = Selector("uploadClipboard")

        self.statusItemView?.statusItem = statusBarItem
        self.statusBarItem?.image = NSImage(named: "StatusHighlighted")
    }
    
    deinit {
        self.statusBar.removeStatusItem(self.statusBarItem!)
    }
}