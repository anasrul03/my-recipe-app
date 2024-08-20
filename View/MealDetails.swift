//
//  MealDetails.swift
//  ThisPlateJoy
//
//  Created by Hanasrullah Halim on 20/05/2024.
//

import Foundation
import SwiftUI

struct MealDetailView: View {
    
    @State private var showNavigationBar = false
    
    let meal: MealModel
    
    var body: some View {
        
        
        ZStack(alignment: .center){
            ScrollView(.vertical){
                VStack(alignment:.leading){
                    AsyncImage(url: URL(string: meal.strMealThumb ?? ""), scale: 2) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }   .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                    VStack(alignment: .leading ){
                        HStack{
                            Text(meal.strMeal).font(.system(size: 34)).fontWeight(.bold).padding(.vertical,3)
                            Image(systemName: "favourite")
                        }
                        HStack{
                            if (meal.strCategory != nil) {
                                Text(meal.strCategory!).font(.caption)
                                    .lineLimit(1)
                                    .padding(7)
                                    .foregroundColor(.blue)
                                    .background(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.blue, lineWidth: 1.5)
                                    ).onTapGesture {
                                        // TODO: redirect to category list
                                    }
                            }
                            
                            if (meal.strArea != nil) {
                                Text(meal.strArea!).font(.caption)
                                    .lineLimit(1)
                                    .padding(7)
                                    .foregroundColor(.blue)
                                    .background(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.blue, lineWidth: 1.5)
                                    ).onTapGesture {
                                        // TODO: redirect to category list
                                    }
                            }
                            
                            
                            
                        }.padding(.vertical, 10)
                        
                        Text(meal.strInstructions ?? "Instruction is not included").font(.subheadline).padding(.horizontal, 5)
                        
                        
                    }.padding([.horizontal, .vertical], 10)
                    
                }
            }
            
            HStack{
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("Get Recipe")
                        .foregroundColor(.white)
                        .padding()
                        .cornerRadius(12)
                        .frame(width: 200, height: 35)
                }
                .buttonStyle(.borderedProminent)
                Button(action: {
                    print("Button tapped")
                }) {
                    Image(systemName: "bookmark")
                        .foregroundColor(.white)
                        .padding()
                        .cornerRadius(12)
                        .frame(width: 70, height: 35)
                }
                .buttonStyle(.borderedProminent)
                
            }.background(Color.red)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            
        }.navigationTitle(meal.strMeal)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(showNavigationBar ? .visible : .hidden, for: .tabBar)
            .onDisappear(perform: {
                
                showNavigationBar.toggle()
                
            })
        
        
        
        
        
        
        
    }
}

#Preview {
    
    MealDetailView( meal: MealModel.randomMeal)
    
}
