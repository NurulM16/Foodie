//
//  FavoritesManager.swift
//  Foodie
//
//  Created by Nurul Mustika on 09/01/25.
//

import CoreData
import UIKit

class FavoritesDataManager {
    static let shared = FavoritesDataManager()
    private init() {}

    private static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FavoriteRecipeModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data stack could not be loaded: \(error)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return Self.persistentContainer.viewContext
    }

    // Save a recipe
    func saveRecipe(_ recipe: SearchRecipesModel) {
        let entity = RecipeModel(context: context)
        entity.id = Int64(recipe.id ?? 0)
        entity.title = recipe.title
        entity.image = recipe.image

        saveContext()
    }

    // Fetch all favorite recipes
    func fetchFavorites() -> [SearchRecipesModel] {
        let fetchRequest: NSFetchRequest<RecipeModel> = RecipeModel.fetchRequest()
        do {
            let results = try context.fetch(fetchRequest)
            return results.map {
                SearchRecipesModel(id: Int($0.id), title: $0.title ?? "", image: $0.image ?? "", imageType: "")
            }
        } catch {
            print("Failed to fetch recipes: \(error)")
            return []
        }
    }

    // Remove a favorite recipe
    func removeRecipe(_ recipe: SearchRecipesModel) {
        let fetchRequest: NSFetchRequest<RecipeModel> = RecipeModel.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", recipe.id ?? 0)

        do {
            if let result = try context.fetch(fetchRequest).first {
                context.delete(result)
                saveContext()
            }
        } catch {
            print("Failed to delete recipe: \(error)")
        }
    }

    // Check if a recipe is favorite
    func isFavorite(_ recipe: SearchRecipesModel) -> Bool {
        let fetchRequest: NSFetchRequest<RecipeModel> = RecipeModel.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", recipe.id ?? 0)

        do {
            let count = try context.count(for: fetchRequest)
            return count > 0
        } catch {
            print("Failed to check favorite status: \(error)")
            return false
        }
    }

    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Failed to save context: \(error)")
            }
        }
    }
}

