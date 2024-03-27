//
//  CircleImage.swift
//  pepper-playground
//
//  Created by Zhang on 2024/2/19.
//

import SwiftUI

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    
    }
}

#Preview {
    CircleImage(image: Image("cat1"))
}
