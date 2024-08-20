

import Foundation


struct MealsResponse: Codable {
    let meals: [MealModel]
}

struct MealModel: Codable, Hashable{

    var idMeal: String
    var strMeal: String
    var strMealThumb: String?
    var strYoutube: String?
    var strSource: String?
    var strInstructions: String?
    var strArea: String?
    var strCategory: String?

    
    
    init(idMeal: String, name: String, mealThumbnail: String, youtubeLink: String, sourceLink: String, instruction: String, area: String, category: String?) {
        
        self.idMeal = idMeal
        self.strMeal = name
        self.strMealThumb = mealThumbnail
        self.strYoutube = youtubeLink
        self.strSource = sourceLink
        self.strInstructions = instruction
        self.strArea = area
        self.strCategory = category
        
        
    }
    
    static var randomMeal: MealModel {
        return MealModel(
            idMeal: "12345",
            name: "Spaghetti Carbonara",
            mealThumbnail: "https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg",
            youtubeLink: "https://www.youtube.com/watch?v=3AAdKl1UYZs",
            sourceLink: "https://www.example.com/spaghetti-carbonara",
            instruction: """
             Bring a large pot of salted water to a boil. Cook spaghetti according to package instructions until al dente. In a large skillet over medium heat, cook pancetta until crispy, about 5 minutes. Add garlic and cook until fragrant, about 1 minute. In a medium bowl, whisk eggs and Parmesan until combined. Drain pasta, reserving 1 cup of pasta water. Add pasta to skillet with pancetta and garlic, tossing to coat. Remove from heat and pour egg mixture over pasta, tossing quickly to create a creamy sauce. Add pasta water a little at a time to loosen the sauce, if needed. Season with salt and pepper. Serve immediately, garnished with more Parmesan and parsley, if desired.
            """,
            area: "Italian",
            category: "Chickens"
        )
    }
    
    
}


