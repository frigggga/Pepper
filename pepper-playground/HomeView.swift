//
//  ProfileView.swift
//  pepper-playground
//
//  Created by Zhang on 2024/2/19.
//

import SwiftUI

struct HomeView: View {
    @Environment(ModelData.self) var modelData
    @State private var currentIndex: Int = 1
    
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: UserDetail(user: modelData.users[currentIndex])) {
                    modelData.users[currentIndex].image
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
                .navigationTitle("Discover your pet lover!")
                HStack {
                    Button(action: {
                        updateDislike()
                    }) {
                        Image(systemName: "hand.thumbsdown")
                            .padding()
                    }
                    
                    Button(action: {
                        updateLike()
                    }) {
                        Image(systemName: "hand.thumbsup")
                            .padding()
                    }
                }
                .padding()
            }

        }
    }
    
    private func updateLike(){
        let otherUser = modelData.users[currentIndex]
        if !modelData.users[currentIndex].likes.contains(otherUser.id) {
            modelData.users[0].likes.append(otherUser.id)
        
            if otherUser.likes.contains(modelData.users[0].id) && !modelData.users[0].matches.contains(otherUser.id){
                matchPet(petId: modelData.users[0].id, likedPetId: otherUser.id)
            }
        }
        moveToNextPet()
    }
    
    private func updateDislike(){
        let otherUser = modelData.users[currentIndex]
        if !modelData.users[currentIndex].dislikes.contains(otherUser.id) {
            modelData.users[0].dislikes.append(otherUser.id)
        }
        moveToNextPet()
    }
            
    private func moveToNextPet() {
        if currentIndex < modelData.users.count - 1 {
            currentIndex += 1
        } else {
            // Reset or show a message that there are no more pets
            // For demonstration, we're resetting the index to 0
            currentIndex = 1
        }
    }
    
    private func matchPet(petId: Int, likedPetId: Int) {
        if let index = modelData.users.firstIndex(where: { $0.id == petId }) {
            modelData.users[index].matches.append(likedPetId)
            if let otherIndex = modelData.users.firstIndex(where: { $0.id == likedPetId }){
                modelData.users[otherIndex].matches.append(petId)
            }
        }
    }
}

        

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        return HomeView()
                .environment(modelData)
    }
}
