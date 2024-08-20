import Foundation
import SwiftUI

struct MealCategory: Codable, Hashable {
    let name: String

    // Coding keys to map the JSON key to the property name
    enum CodingKeys: String, CodingKey {
        case name = "strCategory"
    }
}

struct CategoriesResponse: Codable {
    let categories: [MealCategory]

    // Coding keys to map the JSON key to the property name
    enum CodingKeys: String, CodingKey {
        case categories = "meals"
    }
}




struct ListOfCategories: View {
    @State private var categoriesList: [String]?

    var body: some View {
        NavigationView {
            List(categoriesList ?? [], id: \.self) { category in
                
                NavigationLink(destination: ListByCategories(selectedCategory: category)){
                    
                    Text(category)
                }
                    
   
            }
            .navigationTitle("Categories")
            .navigationBarItems(trailing: Image(systemName: "star"))
            .task {
                do {
                    categoriesList = try await performAPICall()
                } catch PlateJoyError.invalidData {
                    print("Invalid Data")
                } catch PlateJoyError.invalidURL {
                    print("Invalid URL")
                } catch PlateJoyError.invalidResponse {
                    print("Invalid Response")
                } catch {
                    print("Unexpected error: \(error)")
                }
            }
        }
    }

    func performAPICall() async throws -> [String]? {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/list.php?c=list") else {
            throw PlateJoyError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw PlateJoyError.invalidResponse
        }
        do {
            let categoriesResponse = try JSONDecoder().decode(CategoriesResponse.self, from: data)
            return categoriesResponse.categories.map { $0.name }
        } catch {
            throw PlateJoyError.invalidData
        }
    }
}



#Preview {
    ListOfCategories()
}

