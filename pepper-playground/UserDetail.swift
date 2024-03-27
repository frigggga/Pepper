//
//  UserDetail.swift
//  pepper-playground
//
//  Created by Zhang on 2024/2/19.
//

import SwiftUI

struct UserDetail: View {
    @Environment(ModelData.self) var modelData
    @Environment(\.presentationMode) var presentationMode
    
    var user: User
    
    var userIndex: Int {
            modelData.users.firstIndex(where: { $0.id == user.id })!
        }
    
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            VStack {
                
                CircleImage(image: user.image)
                    .offset(y: 100)
                    .padding(.bottom, 100)
                
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.title)
                    
                    HStack {
                        Text("Age: \(user.age)")
                        Spacer()
                        Text("Gender: \(user.gender.rawValue)")
                        Spacer()
                        Text("Size: \(user.size.rawValue)")
                        Spacer()
                        Text("Type: \(user.type.rawValue)")
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    
                    Divider()
                    
                    Text("About \(user.name)")
                        .font(.title2)
                    Text(user.description)
   
                }
                
                .padding()
                Spacer()
                
            }
            .navigationTitle(user.name)
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}


#Preview {
    let modelData = ModelData()
        return UserDetail(user: modelData.users[0])
            .environment(modelData)
}
