//
//  Currencies.swift
//  Kurrency
//
//  Created by Ard Stavileci on 7/16/17.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import Foundation
import ObjectMapper
import CoreData

class Currency: NSManagedObject, Mappable {
	
	@NSManaged var currencyName: String!
	@NSManaged var currencySymbol: String?
	@NSManaged var id: String!
	
	override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            super.init(entity: entity, insertInto: nil)
            return
        }
		super.init(entity: entity, insertInto: appDelegate.persistentContainer.viewContext)
	}
	
	required init?(map: Map) {
        //TODO: USE GUARD HERE
		let ctx = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
		let entity = NSEntityDescription.entity(forEntityName: "Currency", in: ctx)
		super.init(entity: entity!, insertInto: ctx)
		mapping(map: map)
	}
	
	func mapping(map: Map) {
		currencyName   <- map["currencyName"]
		currencySymbol <- map["currencySymbol"]
		id			   <- map["id"]
	}
}
