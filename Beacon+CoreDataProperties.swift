//
//  Beacon+CoreDataProperties.swift
//  
//
//  Created by Umoru Joseph on 3/21/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Beacon {

    @NSManaged var location: String?
    @NSManaged var timestamp: String?
    @NSManaged var distance1: NSNumber?
    @NSManaged var distance2: NSNumber?
    @NSManaged var distance3: NSNumber?
    @NSManaged var distance4: NSNumber?

}
