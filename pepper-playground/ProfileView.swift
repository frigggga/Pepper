//
//  ProfileView.swift
//  pepper-playground
//
//  Created by Zhang on 2024/2/19.
//

import SwiftUI

struct ProfileView: View {
    @Environment(ModelData.self) var modelData
    
    var user: User

    
    var body: some View {
        UserDetail(user: modelData.users[0])
    }
}


#Preview {
    let modelData = ModelData()
        return ProfileView(user: modelData.users[0])
            .environment(modelData)
}
