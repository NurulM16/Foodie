//
//  IngredientViewController.swift
//  Foodie
//
//  Created by Nurul Mustika on 12/12/24.
//

import UIKit
import Kingfisher

protocol DetailRecipeIngredientViewToPresenterProtocol {
    var view: DetailRecipeIngredientPresenterToViewProtocol? {get set}
    var interactor: DetailRecipeIngredientPresenterToInteractorProtocol? {get set}
    var router:
    DetailRecipeIngredientPresenterToRouterProtocol? {get set}
    func getIngredientImage(id: Int)
}

class IngredientViewController: UIViewController {
    
    @IBOutlet weak var imgIngredient: UIImageView!
    
    var presenter: DetailRecipeIngredientViewToPresenterProtocol?
    var detailRecipe: SearchRecipesModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getIngredientImage(id: detailRecipe?.id ?? 0)
    }

}

extension IngredientViewController: DetailRecipeIngredientPresenterToViewProtocol {
    func onSuccess(image: UIImage?) {
        if let img = image {
            imgIngredient.image = img
        } else {
            imgIngredient.image = UIImage(systemName: "photo.fill")
        }
    }
    
    func fetchFailed(error: String) {
        print("fetching failed \(error)")
    }
    
    func isLoading(isLoading: Bool) {
        self.loading(status: isLoading)
    }
    
    
}
