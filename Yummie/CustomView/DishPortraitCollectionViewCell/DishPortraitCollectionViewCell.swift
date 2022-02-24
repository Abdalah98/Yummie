//
//  DishPortraitCollectionViewCell.swift
//  Yummie
//
//  Created by Abdallah on 2/23/22.
//

import UIKit
import Kingfisher
class DishPortraitCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var cardViews: CardView!
  
    @IBOutlet weak var discriptionLabel: UILabel!
    func setup(dish:Dish){
        titleLabel.text = dish.title
        caloriesLabel.text = dish.fomattedCalories
        discriptionLabel.text = dish.discription
        dishImage.kf.setImage(with: dish.image?.asUrl)
    }

}
