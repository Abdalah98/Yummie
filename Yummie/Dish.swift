//
//  Dish.swift
//  Yummie
//
//  Created by Abdallah on 2/23/22.
//

import Foundation
struct Dish {
    let id,title , image  , discription : String?
    let calories: Double?
    
    var fomattedCalories:String {
        return String(format: ".2f% calories",calories ?? 0)
    }
}
