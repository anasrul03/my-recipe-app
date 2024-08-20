//
//  ProfileView.swift
//  ThisPlateJoy
//
//  Created by Hanasrullah Halim on 04/08/2024.
//

import Foundation
import SwiftUI

struct ProfileView:View{
    var body: some View{
        NavigationView{
            VStack{
                DynamicAvatar(image: Image(systemName: "figure.walk.circle.fill"), size: 200)
                Text("Hello")
            }

        }.navigationTitle("Profile").navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView()
}
