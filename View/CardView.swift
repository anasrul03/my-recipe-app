//
//  CardView.swift
//  ThisPlateJoy
//
//  Created by Hanasrullah Halim on 05/05/2024.
//

import Foundation
import SwiftUI

struct CardView: View {
    let meal: MealModel? // Define meal as Any type
    
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: meal?.strMealThumb ?? ""), scale: 2) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 70, height: 70)
            .aspectRatio(contentMode: .fit)
            .clipShape(Rectangle(), style: FillStyle()).cornerRadius(8)
            VStack(alignment: .leading) {
                
                HStack{
                    Text(meal?.strMeal ?? "Meal Name")
                        .font(.headline)
                    Spacer()
                    Menu {
                        Button("Copy name", systemImage: "doc.on.doc") {
                            UIPasteboard.general.string = meal?.strMeal                                 
                        }
                        Button("Copy id", systemImage: "doc.om.doc") {
                            UIPasteboard.general.string = meal?.idMeal
                        }
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.blue)
                            .imageScale(.small)
                    }
                    
                }
                
                
                
                Text(meal?.strArea ?? "Meal Area").font(.subheadline).foregroundColor(.secondary)
                Spacer()
                HStack{
                    Spacer()
                    Text(meal?.idMeal ?? "Meal Area")
                    
                }.font(.caption2).foregroundColor(.gray)
                
            }
            .padding(10)
            
        }
    }
    
}

#Preview {
    CardView(meal: MealModel.randomMeal)
}





