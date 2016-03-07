//
//  Beacon+CoreDataProperties.swift
//  MasterProjectv1
//
//  Created by Umoru Joseph on 12/15/15.
//  Copyright © 2015 Umoru Joseph. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Beacon {

    @NSManaged var uuid: String?
    @NSManaged var major: NSNumber?
    @NSManaged var minor: NSNumber?
    @NSManaged var location: String?

}
