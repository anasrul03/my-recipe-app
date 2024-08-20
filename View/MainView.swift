//
//  MainView.swift
//  ThisPlateJoy
//
//  Created by Hanasrullah Halim on 12/05/2024.
//

import Foundation
import SwiftUI


struct MainView: View{
    var body: some View{
        NavigationView{
            
            Group{
                TabView{
                    ListOfMealView(navigationTitle: "Recipes",listType:   FilterTypeEnum.firstLetter, endpoint: "h").tabItem { Label("Home" ,systemImage: "circle.grid.3x3")}
                    ListOfCategories().tabItem { Label("Categories" ,systemImage: "tray")}
                    ListOfArea().tabItem { Label("Area" ,systemImage: "location")}
                    ProfileView().tabItem { Label("Setting" ,systemImage: "gear")}
                    
                }
            }
            
            
            
        }
        
    }
}






#Preview {
    MainView()
}
