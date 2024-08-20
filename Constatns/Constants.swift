//
//  Constants.swift
//  ThisPlateJoy
//
//  Created by Hanasrullah Halim on 29/06/2024.
//

import Foundation
import SwiftUI


struct Constants {
    struct API{
        static let baseURL = "https://www.themealdb.com/api/json/v1/1"
        static let areaURL = baseURL+"/api/json/v1/1/filter.php?a="
        static let categoryURL = baseURL+"/api/json/v1/1/filter.php?c="
        static let mainIngredientMealURL = baseURL+"/api/json/v1/1/filter.php?i="
        static let randomMealURL = baseURL+"/api/json/v1/1/random.php"
        static let firstLetterMealURL = baseURL+"/api/json/v1/1/search.php?f="
    }
}
