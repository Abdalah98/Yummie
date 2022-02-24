//
//  DishLandscapeCollectionViewCell.swift
//  Yummie
//
//  Created by Abdallah on 2/24/22.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
       func setup(dish:Dish){
          titleLabel.text = dish.title
          caloriesLabel.text = dish.fomattedCalories
        descriptionLabel.text = dish.discription
          dishImage.kf.setImage(with: dish.image?.asUrl)
      }
}
