//
//  ContentView.swift
//  pepper-playground
//
//  Created by Zhang on 2024/2/19.
//

import SwiftUI

struct ContentView: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            MessageView(user: modelData.users[0])
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Messages")
                }
            
            ProfileView(user: modelData.users[0])
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}




#Preview {
    ContentView().environment(ModelData())
}
