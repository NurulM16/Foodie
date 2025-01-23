//
//  SearchRecipesViewController.swift
//  Foodie
//
//  Created by Nurul Mustika on 29/11/24.
//

import UIKit

class SearchRecipesViewController: UIViewController {
    
    @IBOutlet weak var sbRecipes: UISearchBar!
    @IBOutlet weak var collectionViewSearchRecipes: UICollectionView!
    
    
    var presenter: SearchRecipesViewToPresenterProtocol?
    var data: SearchRecipesResponse?
    var dataList: [SearchRecipesModel] = []

    
    override func viewDidLoad() {
        setupCollectionView()
        setupSearchBar()
        fetchPresenter(query: "")
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        fetchPresenter(query: "")
    }
    
    private func fetchPresenter(query: String) {
        presenter?.searchRecipes(query: query)
    }
    
    private func setupSearchBar() {
        sbRecipes.delegate = self
//        sbRecipes.becomeFirstResponder()
        setupToolBar()
    }
    
    private func setupToolBar() {
        let toolbar = UIToolbar()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                        target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done,
                                         target: self, action: #selector(doneButtonTapped))
        
        toolbar.setItems([flexSpace, doneButton], animated: true)
        toolbar.sizeToFit()
        
        sbRecipes.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonTapped() {
        view.endEditing(true)
    }
    
}

extension SearchRecipesViewController: SearchRecipesPresenterToViewProtocol {
    func onSuccess(data: SearchRecipesResponse?) {
        self.data = data
        self.dataList = data?.results ?? []
        self.collectionViewSearchRecipes.reloadData()
    }
    
    func fetchFailed(error: String) {
        print("failed fetching data")
        
    }
    
    func isLoading(isLoading: Bool) {
        self.loading(status: isLoading)
    }
    
    private func setupCollectionView() {
        collectionViewSearchRecipes.register(type: SearchRecipesCollectionViewCell.self)
        collectionViewSearchRecipes.delegate = self
        collectionViewSearchRecipes.dataSource = self
        collectionViewSearchRecipes.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
}

extension SearchRecipesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("data list count \(self.dataList.count)")
        return self.dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(ofType: SearchRecipesCollectionViewCell.self, at: indexPath)
        cell.configureCell(model: self.dataList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
              let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
              let size:CGFloat = (collectionViewSearchRecipes.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size + 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedRecipe = dataList[indexPath.row]
        guard let navigationController = self.navigationController else { return }
        presenter?.router?.navigateToDetailRecipe(navigatorController: navigationController, searchRecipe: selectedRecipe)
    }
    
    
}

extension SearchRecipesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        fetchPresenter(query: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true)
    }
}
