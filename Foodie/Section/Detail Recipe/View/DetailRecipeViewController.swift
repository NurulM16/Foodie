//
//  DetailRecipeViewController.swift
//  Foodie
//
//  Created by Nurul Mustika on 03/12/24.
//

import Foundation
import UIKit
import WebKit
import LZViewPager

class DetailRecipeViewController: UIViewController, LZViewPagerDelegate, LZViewPagerDataSource {
    
    @IBOutlet weak var imgDetailRecipe: UIImageView!
    @IBOutlet weak var lblTitleDetailRecipe: UILabel!
    @IBOutlet weak var lblCookingTime: UILabel!
    @IBOutlet weak var lblServings: UILabel!
    @IBOutlet weak var lblHealthScore: UILabel!
    @IBOutlet weak var webViewSummary: WKWebView!
    @IBOutlet weak var webViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewPager: LZViewPager!
    @IBOutlet weak var imgFavorite: UIImageView!
    
    var presenter: DetailRecipeViewToPresenterProtocol?
    var searchRecipe: SearchRecipesModel?
    
    var subControllers: [UIViewController] = []
    private var isFavorite: Bool = false

    override func viewDidLoad() {
        setupComponentView()
        setupWKWebView()
        presenter?.getRecipeInformation(id: searchRecipe?.id ?? 0)
        viewPagerProperties()
        presenter?.viewDidLoad(recipe: searchRecipe)
    }
    
    private func setupComponentView() {
        viewContainer.roundCorners(corners: [.topLeft, .topRight], radius: 20)
    }
    
    private func setupWKWebView() {
        webViewSummary.navigationDelegate = self
        webViewSummary.translatesAutoresizingMaskIntoConstraints = false
        
        //Height constraint (dynamic)
//        webViewHeightConstraint = webViewSummary.heightAnchor.constraint(equalToConstant: 1)
        webViewHeightConstraint.isActive = true
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(favoriteTapped))
        imgFavorite.addGestureRecognizer(tapGesture)
    }
    
    @objc private func favoriteTapped() {
        presenter?.didTapFavoriteButton(recipe: searchRecipe)
    }
    
    func viewPagerProperties() {
        viewPager.delegate = self
        viewPager.dataSource = self
        viewPager.hostController = self
        
        let vc1 = DetailRecipeIngredientRouter.createModule()
        vc1.detailRecipe = searchRecipe
        let vc2 = DetailRecipeNutritionRouter.createModule()
        vc2.detailRecipe = searchRecipe
        subControllers = [vc1, vc2]
        
        vc1.title = "Ingredient"
        vc2.title = "Nutrition"
        viewPager.reload()
    }
    
    func numberOfItems() -> Int {
        return subControllers.count
    }
    
    func controller(at index: Int) -> UIViewController {
        return subControllers[index]
    }
    
    func button(at index: Int) -> UIButton {
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }

    func colorForIndicator(at index: Int) -> UIColor {
        return .darkGray
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
    
    func updateFavoriteIcon(isFavorite: Bool) {
        let imageName = isFavorite ? "heart.fill" : "heart"
        imgFavorite.image = UIImage(systemName: imageName)
    }
    
}

extension DetailRecipeViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            // Get the height of the content
//            let contentHeight = webView.scrollView.contentSize.height - 200
//            
//            print("content height \(contentHeight)")
            
            // Update the web view height constraint
            self.webViewHeightConstraint.constant = 150
            self.view.layoutIfNeeded() // Refresh layout
        }
    }
}
