//
//  FavoriteTableViewCell.swift
//  Foodie
//
//  Created by Nurul Mustika on 08/01/25.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var imgFavorite: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

extension FavoriteTableViewCell: CellViewModelType {
    func configureCell(model: SearchRecipesModel) {
        lblTitle.text = model.title
        if let imageUrlString = model.image {
            let imageUrl = URL(string: imageUrlString)
            imgFavorite.kf.setImage(with: imageUrl)
        }
    }
    
}
