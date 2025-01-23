//
//  FavoriteViewController.swift
//  Foodie
//
//  Created by Nurul Mustika on 08/01/25.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var tblViewFavorite: UITableView!
    
    var presenter: FavoriteRecipePresenterInput?
    var favoriteRecipes: [SearchRecipesModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewDidLoad()
    }
    
    private func setupView() {
        tblViewFavorite.register(type: FavoriteTableViewCell.self)
        tblViewFavorite.delegate = self
        tblViewFavorite.dataSource = self
    }

}

extension FavoriteViewController: FavoriteRecipePresenterOutput {
    func showFavoriteRecipes(recipes: [SearchRecipesModel]) {
        favoriteRecipes = recipes
        tblViewFavorite.reloadData()
        
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default))
               present(alert, animated: true)
    }
    
    func refreshFavoriteRecipes() {
        presenter?.viewDidLoad()
    }
    
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: FavoriteTableViewCell.self, at: indexPath)
        cell.configureCell(model: favoriteRecipes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFavoriteRecipe = favoriteRecipes[indexPath.row]
        presenter?.didSelectRecipe(recipe: selectedFavoriteRecipe)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let favoriteRecipeToDelete = favoriteRecipes[indexPath.row]
            presenter?.didRemoveFavorite(recipe: favoriteRecipeToDelete)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(120)
    }
}

