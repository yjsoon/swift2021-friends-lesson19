//
//  ContentView.swift
//  Friends
//
//  Created by YJ Soon on 3/7/21.
//

import SwiftUI

struct ContentView: View {
    
    var friends = [Friend(name: "Enzo",
                          icon: "zzz",
                          school: "Unknown sk00l",
                          slothImage: "sloth3"),
                   Friend(name: "Daksh",
                          icon: "swift",
                          school: "SST",
                          slothImage: "sloth2"),
                   Friend(name: "Celeste",
                          icon: "wifi",
                          school: "DHS",
                          slothImage: "sloth1")]

    
    var body: some View {
        NavigationView {
            List(friends) { friend in
                NavigationLink(destination: FriendDetailView(friend: friend)) {
                    Image(systemName: friend.icon)
                    VStack(alignment: .leading) {
                        Text(friend.name)
                            .font(.headline)
                        Text(friend.school)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                }
            }
            .navigationTitle("Friends")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
