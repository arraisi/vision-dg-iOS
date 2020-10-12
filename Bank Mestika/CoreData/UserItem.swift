//
//  UserItem.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 11/10/20.
//

import Foundation
import CoreData

public class UserItem:NSManagedObject, Identifiable {
    @NSManaged public var deviceId: String?
    @NSManaged public var nik: String?
    @NSManaged public var phone: String?
}

extension UserItem {
    
}
