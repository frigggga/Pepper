//
//  MessageView.swift
//  pepper-playground
//
//  Created by Zhang on 2024/2/19.
//

import SwiftUI

struct MessageView: View {
    @Environment(ModelData.self) var modelData
    
    var user: User
    
    var matchedUsers: [User] {
            user.matches.compactMap { matchId in
                modelData.users.first { $0.id == matchId }
            }
        }
    
    var body: some View {
            NavigationSplitView {
                if matchedUsers.count > 0 {
                    Text("Congratulations! You've got a list of mathced pets")
                }else{
                    Text("Go and find more matches!")
                }
                List(matchedUsers) { matchUser in
                    NavigationLink {
                        ChatView(user: user, matchUser: matchUser)
                    } label: {
                        matchUser.image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Text(matchUser.name)
                    }
                }
                .navigationTitle("Message")
            } detail: {
                Text("Select a user to chat with")
            }
        }
}

#Preview {
    let modelData = ModelData()
    return MessageView(user: modelData.users[0])
        .environment(modelData)
}
