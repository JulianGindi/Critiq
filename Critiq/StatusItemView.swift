//
//  StatusItemView.swift
//  Critiq
//
//  Created by Julian Gindi on 3/8/15.
//  Copyright (c) 2015 Julian Gindi. All rights reserved.
//

import Cocoa

class StatusItemView: NSView {
    var image : NSImage?
    var statusItem: NSStatusItem? {
        didSet {
            println("foo")
            self.setUp()
        }
    }

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        self.image = NSImage(named: "StatusHighlighted")
    
    }
    
    func setUp() {
        
    }
    
}
