//
//  OnboardingCell.swift
//  Yummie
//
//  Created by Abdallah on 1/16/22.
//

import UIKit

class OnboardingCell: UICollectionViewCell {

    static let identifier = String(describing: OnboardingCell.self)
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(result: OnBoardingSlid){
        slideTitleLabel.text = result.title
        slideDescriptionLabel.text = result.description
        slideImageView.image = result.image
    }
}
