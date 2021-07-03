//
//  FriendDetailView.swift
//  Friends
//
//  Created by YJ Soon on 3/7/21.
//

import SwiftUI

struct FriendDetailView: View {
    
    var friend: Friend
    
    var body: some View {
        Text(friend.name)
            .navigationTitle(friend.name)
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(friend: Friend(name: "Celeste",
                                        icon: "wifi",
                                        school: "DHS",
                                        slothImage: "sloth1"))
    }
}
