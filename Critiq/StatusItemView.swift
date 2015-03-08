//
//  StatusItemView.swift
//  Critiq
//
//  Created by _ on 3/8/15.
//  Copyright (c) 2015 JulianGindi. All rights reserved.
//

import Cocoa

class StatusItemView: NSView {
    var image : NSImage?

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        self.image = NSImage(named: "StatusHighlighted")
    
    }
    
}
