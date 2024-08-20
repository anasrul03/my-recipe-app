//
//  DynamicAvatar.swift
//  ThisPlateJoy
//
//  Created by Hanasrullah Halim on 04/08/2024.
//

import Foundation
import SwiftUI

struct DynamicAvatar: View {
    let image: Image
    let size: CGFloat

    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
            .cornerRadius(size / 2)
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: 4)
                    .frame(width: size, height: size)
            )
            .shadow(radius: 10)
    }
}
