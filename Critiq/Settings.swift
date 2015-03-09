//
//  Settings.swift
//  Critiq
//
//  Created by Thomas Degry and Julian Gindi on 3/9/15.
//  Copyright (c) 2015 Thomas Degry and Julian Gindi. All rights reserved.
//

import Foundation
import CoreData

class Settings: NSManagedObject {

    @NSManaged var defaultDuration: NSNumber
    @NSManaged var defaultLanguage: String

}
