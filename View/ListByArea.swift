//
//  ListByCategories.swift
//  ThisPlateJoy
//
//  Created by Hanasrullah Halim on 02/06/2024.
//

import Foundation
import SwiftUI

struct ListByArea: View {
    @State private var showNavigationBar = false
    let selectedArea: String
    @State private var mealList: [MealModel]?
    var body: some View {
        
        
        List(mealList ?? [], id: \.self){m in
            
            NavigationLink(destination: MealDetailView( meal: m)) {
                CardView(meal:m)
                
            }
        }.navigationTitle(selectedArea).toolbar(showNavigationBar ? .visible : .hidden, for: .tabBar).onDisappear(perform: {
            
            showNavigationBar.toggle()
            
        }).task {
            do{
                
                mealList = try await performAPICall()
            }
            catch PlateJoyError.invalidData{
                print("Invalid Data")
            } catch PlateJoyError.invalidURL{
                print("Invalid URL")
            } catch PlateJoyError.invalidResponse{
                print("Invalid Response")
            }catch{
                print("")
            }
        }
        
        
    }
    func performAPICall() async throws -> [MealModel]? {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?a=\(selectedArea)") else{
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
    
}

#Preview {
    ListByArea(selectedArea: "American")
}
