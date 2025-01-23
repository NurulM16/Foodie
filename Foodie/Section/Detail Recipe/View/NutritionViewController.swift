//
//  NutritionViewController.swift
//  Foodie
//
//  Created by Nurul Mustika on 12/12/24.
//

import UIKit
import WebKit

class NutritionViewController: UIViewController {
    
    @IBOutlet weak var imgNutrition: UIImageView!
    
    var presenter: DetailRecipeNutritionPresenterInput?
    var detailRecipe: SearchRecipesModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(id: detailRecipe?.id ?? 0)
    }

}

extension NutritionViewController: DetailRecipeNutritionPresenterOutput {
    func showImage(image: UIImage?) {
        if let img = image {
            imgNutrition.image = img
        } else {
            imgNutrition.image = UIImage(systemName: "photo.fill")
        }
    }
    
    func showError(message: String) {
        print("fetching failed \(message)")
    }
    
    func showLoading(isLoading: Bool) {
        self.loading(status: isLoading)
    }
    
    
}
