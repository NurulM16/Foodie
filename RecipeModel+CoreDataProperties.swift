//
//  RecipeModel+CoreDataProperties.swift
//  
//
//  Created by Nurul Mustika on 13/01/25.
//
//

import Foundation
import CoreData


extension RecipeModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeModel> {
        return NSFetchRequest<RecipeModel>(entityName: "RecipeModel")
    }

    @NSManaged public var id: Int64
    @NSManaged public var image: String?
    @NSManaged public var title: String?

}
