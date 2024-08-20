//
//  ApiService.swift
//  ThisPlateJoy
//
//  Created by Hanasrullah Halim on 29/06/2024.
//

import Foundation

class ApiService{
    
    func performAPICall(filterType: FilterTypeEnum?, endpoint: String?) async throws -> [MealModel]? {
        guard let url = URL(string: "\(getUrl(for: filterType))\(endpoint ?? "")") else{
            throw PlateJoyError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {throw PlateJoyError.invalidResponse
        }
        do{
            
            let mealResponse = try JSONDecoder().decode(MealsResponse.self, from: data)
            return mealResponse.meals
            
            
        }catch{
            throw PlateJoyError.invalidData
        }
        
    }
    
    
    func getUrl(for listType: FilterTypeEnum?)-> String{
        typealias APIConstants = Constants.API
        guard let type = listType else {
            return ""
        }
        
        switch type{
        case .area:
            return APIConstants.areaURL
        case .categories:
            return APIConstants.categoryURL
        case .mainIngredient:
            return APIConstants.mainIngredientMealURL
        case .random:
            return APIConstants.randomMealURL
        case .firstLetter:
            return APIConstants.firstLetterMealURL
        }
    }
}
