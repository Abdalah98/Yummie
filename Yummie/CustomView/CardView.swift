//
//  CardView.swift
//  Yummie
//
//  Created by Abdallah on 2/23/22.
//

import UIKit
class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        initiaSetup()
    }
    
    private func initiaSetup(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        cornerRadius = 10
    }
}
