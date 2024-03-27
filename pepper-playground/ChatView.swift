//
//  ChatView.swift
//  pepper-playground
//
//  Created by Zhang on 2024/2/19.
//

import SwiftUI

struct ChatView: View {
    var user: User
    var matchUser: User
    @State private var text: String = ""

    var body: some View {
        VStack{
            Text("Chat with \(matchUser.name)")
            TextField("Enter your message", text: $text)
                .multilineTextAlignment(.center)

        }
        .navigationTitle(matchUser.name)
        .navigationBarTitleDisplayMode(.inline)
    }

}

#Preview {
    let modelData = ModelData()
    return ChatView(user: modelData.users[0], matchUser: modelData.users[1])
        .environment(modelData)
}
