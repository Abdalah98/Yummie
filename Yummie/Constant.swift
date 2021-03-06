//
//  Constant.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/15/21.
//

import Foundation

enum URLS {
    
    static let country            = "eg"
    static let resultsLimit       = "100"
    static let mediaType          = "apple-music"

    static let main               = "https://rss.itunes.apple.com"
    static let entity             =  main + "/api/v1/\(country)/\(mediaType)/"
    
    static let topSongs           = entity + "top-songs/all/\(resultsLimit)/explicit.json"

}


enum Constant {
    
 //   static let OnboardingCell              = "OnboardingCell"
    
}


enum Cell {
    
    static let onboardingCell  		                	= "OnboardingCell"
    static let categoryCollectionViewCell               = "CategoryCollectionViewCell"
    static let dishPortraitCollectionViewCell           = "DishPortraitCollectionViewCell"
    static let dishLandscapeCollectionViewCell          = "DishLandscapeCollectionViewCell"

}




