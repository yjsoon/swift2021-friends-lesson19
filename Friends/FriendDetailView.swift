//
//  FriendDetailView.swift
//  Friends
//
//  Created by YJ Soon on 3/7/21.
//

import SwiftUI

let heroPicHeight: CGFloat = 250
let profilePicSize: CGFloat = 150

struct FriendDetailView: View {
    
    @Binding var friend: Friend
    
    var body: some View {
        VStack(spacing: 0) {
            Image(friend.slothImage)
                .resizable()
                .scaledToFill()
                .frame(height: heroPicHeight)
            
            Image(friend.name)
                .resizable()
                .scaledToFill()
                .frame(width: profilePicSize, height: profilePicSize)
                .mask(Circle())
                .overlay(Circle().stroke(lineWidth: 10).foregroundColor(.white))
                .offset(x: 0, y: -profilePicSize/2)
                .shadow(radius: 10)
                .padding(.bottom, -profilePicSize/2 + 20)
            
            // Can also use HStack, or a Label
            Text("\(Image(systemName: friend.icon)) \(friend.school)")
                .font(.system(size: 24))
                .padding()
            
            VStack(alignment: .leading) {
                Text("Attack")
                Slider(value: $friend.attack,
                       in: 0...15,
                       step: 1)
                
                Text("Defence")
                Slider(value: $friend.defence,
                       in: 0...15,
                       step: 1)
            }
            .padding()

            Spacer()
        }
            .navigationTitle(friend.name)
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(friend: .constant(Friend(name: "Yi Kai",
                                        icon: "wifi",
                                        school: "Another School",
                                        slothImage: "sloth1")))
    }
}
