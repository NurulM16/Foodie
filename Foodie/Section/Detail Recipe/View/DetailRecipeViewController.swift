//
//  DetailRecipeViewController.swift
//  Foodie
//
//  Created by Nurul Mustika on 03/12/24.
//

import Foundation
import UIKit
import WebKit

class DetailRecipeViewController: UIViewController {
    
    @IBOutlet weak var imgDetailRecipe: UIImageView!
    @IBOutlet weak var lblTitleDetailRecipe: UILabel!
    @IBOutlet weak var lblCookingTime: UILabel!
    @IBOutlet weak var lblServings: UILabel!
    @IBOutlet weak var lblHealthScore: UILabel!
    @IBOutlet weak var webViewSummary: WKWebView!
    @IBOutlet weak var viewContainer: UIView!
    
    var presenter: DetailRecipeViewToPresenterProtocol?
    var searchRecipe: SearchRecipesModel?
    
    override func viewDidLoad() {
        setupComponentView()
        presenter?.getRecipeInformation(id: searchRecipe?.id ?? 0)
    }
    
    private func setupComponentView() {
        viewContainer.roundCorners(corners: [.topLeft, .topRight], radius: 20)
    }
    
    private func setupViews(detailRecipe: GetRecipeInformationResponse?) {
        if let imageUrlString = detailRecipe?.image {
            let imageUrl = URL(string: imageUrlString)
            imgDetailRecipe.kf.setImage(with: imageUrl)
        }
        lblTitleDetailRecipe.text = detailRecipe?.title
        if let cookingTime = detailRecipe?.cookingMinutes {
            lblCookingTime.text = String(describing: "\(cookingTime) mins")
        }
        if let servings = detailRecipe?.servings {
            lblServings.text = String(describing: servings)
        }
        if let healthScore = detailRecipe?.healthScore {
            lblHealthScore.text = String(describing: healthScore)
        }
        if let summary = detailRecipe?.summary {
            webViewSummary.loadHTMLContent(summary)
        }
    }
    
}

extension DetailRecipeViewController: DetailRecipePresenterToViewProtocol {
    func onSuccess(data: GetRecipeInformationResponse?) {
        setupViews(detailRecipe: data)
    }
    
    func fetchFailed(error: String) {
        print("fetching failed")
    }
    
    func isLoading(isLoading: Bool) {
        self.loading(status: isLoading)
    }
    
    
    
}
