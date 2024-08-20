//
//  CustomTextButton.swift
//  MyRecipe
//
//  Created by Hanasrullah Halim on 14/08/2024.
//

import Foundation
import SwiftUI


struct CustomTextButton: View {
    var action:()->Void
    var label:String
    var backgroundColor:Color
    var body: some View {
        Button(action:action) {
            Text(label)
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(12.0)
            
        }
    }
}
