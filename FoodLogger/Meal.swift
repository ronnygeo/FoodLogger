//
//  Meal.swift
//  FoodLogger
//
//  Created by Ronny Mathew on 6/7/16.
//  Copyright © 2016 Betaturf. All rights reserved.
//

import UIKit

class Meal {
    var name: String
    var rating: Int
    var photo: UIImage?
    
    init?(name: String, rating: Int, photo: UIImage?) {
        self.name = name
        self.rating = rating
        self.photo = photo
        
        if (name == "" || rating < 0) {
            return nil
        }
    }
}
