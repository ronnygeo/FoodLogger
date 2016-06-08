//
//  FoodLoggerTests.swift
//  FoodLoggerTests
//
//  Created by Ronny Mathew on 5/19/16.
//  Copyright © 2016 Betaturf. All rights reserved.
//

import XCTest
@testable import FoodLogger

class FoodLoggerTests: XCTestCase {
    
//MARK: FoodLogger Tests
    
    func testMealInitialization () {
        //success case
        let goodMeal = Meal(name: "Tortilla Wrap", rating: 5, photo: nil)
        XCTAssertNotNil(goodMeal)
        
        //Failure case
        let noMeal = Meal(name: "", rating: 0, photo: nil)
        XCTAssertNil(noMeal, "Meal name cannot be blank")
        
        //Failure case: Rating less than 0
        let ratingErrorMeal = Meal(name: "Good Food", rating: -1, photo: nil)
        XCTAssertNil(ratingErrorMeal, "rating cannot be less than 0")
        
    }
    
}
