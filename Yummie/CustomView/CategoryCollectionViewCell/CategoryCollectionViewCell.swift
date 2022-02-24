//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by Abdallah on 2/23/22.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
   
    func setup(category:DishCategory){
        categoryImage.kf.setImage(with:category.image.asUrl)
        categoryLabel.text   = category.name
    }
}
