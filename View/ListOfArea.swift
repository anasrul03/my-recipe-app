import Foundation
import SwiftUI


struct MealArea: Codable, Hashable {
    let name: String

    // Coding keys to map the JSON key to the property name
    enum CodingKeys: String, CodingKey {
        case name = "strArea"
    }
}

struct AreasResponse: Codable {
    let areas: [MealArea]

    // Coding keys to map the JSON key to the property name
    enum CodingKeys: String, CodingKey {
        case areas = "meals"
    }
}



struct ListOfArea: View {
    @State private var areaList: [String]?

    var body: some View {
        NavigationView {
            List(areaList ?? [], id: \.self) { area in
                
                NavigationLink(destination: ListByArea(selectedArea: area)){
                    
                    Text(area)
                }
                    
   
            }
            .navigationTitle("Areas")
            .navigationBarItems(trailing: Image(systemName: "star"))
            .task {						
                do {
                    areaList = try await performAPICall()
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
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/list.php?a=list") else {
            throw PlateJoyError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw PlateJoyError.invalidResponse
        }
        do {
            let categoriesResponse = try JSONDecoder().decode(AreasResponse.self, from: data)
            return categoriesResponse.areas.map { $0.name }
        } catch {
            throw PlateJoyError.invalidData
        }
    }
}



#Preview {
    ListOfArea()
}

