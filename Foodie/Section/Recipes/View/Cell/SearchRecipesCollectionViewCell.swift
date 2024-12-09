//
//  SearchRecipesCollectionViewCell.swift
//  Foodie
//
//  Created by Nurul Mustika on 29/11/24.
//

import UIKit
import Kingfisher

class SearchRecipesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgRecipe: UIImageView!
    @IBOutlet weak var lblTitleRecipe: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension SearchRecipesCollectionViewCell: CellViewModelType {
    func configureCell(model: SearchRecipesModel) {
        lblTitleRecipe.text = model.title
        if let imageUrlString = model.image {
            let imageUrl = URL(string: imageUrlString)
            imgRecipe.kf.setImage(with: imageUrl)
        }
    }
    
}
