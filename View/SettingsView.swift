//
//  SettingsView.swift
//  ThisPlateJoy
//
//  Created by Hanasrullah Halim on 04/08/2024.
//

import Foundation
import SwiftUI

struct SettingsView:View {
    let settings: [Setting] = [
        Setting(title: "Account", routeName: "account"),
       Setting(title: "Feedback", routeName: "feedback"),
       Setting(title: "Sign in", routeName: "sign_in"),
    ]
    var body: some View {
        NavigationView{
            List(settings, id: \.self){
                setting in
                NavigationLink(destination: ProfileView()){
                    
                    Text(setting.title)
                }
            }.navigationTitle("Settings")
       
        }
    }
}

#Preview {
    SettingsView()
}
