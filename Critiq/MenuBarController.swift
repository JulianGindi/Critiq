//
//  MenubarController.swift
//  Critiq
//
//  Created by Julian Gindi on 3/8/15.
//  Copyright (c) 2015 JulianGindi. All rights reserved.
//

import AppKit



class MenuBarController:NSObject {
    let statusBar = NSStatusBar.systemStatusBar()
    let statusBarItem : NSStatusItem?
    let statusItemView : StatusItemView?
    
    override init() {
        statusBarItem = statusBar.statusItemWithLength(24.0)
    }
}