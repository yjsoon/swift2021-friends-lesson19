//
//  ContentView.swift
//  Friends
//
//  Created by YJ Soon on 3/7/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var friends = [Friend(name: "Ritesh",
                          icon: "zzz",
                          school: "Unknown sk00l",
                          slothImage: "sloth3",
                          types: [.ice, .fire]),
                   Friend(name: "Yi Kai",
                          icon: "swift",
                          school: "Another School",
                          slothImage: "sloth2",
                          types: [.electric, .grass, .ice]),
                   Friend(name: "Hraday",
                          icon: "wifi",
                          school: "Yet Another School",
                          slothImage: "sloth1",
                          types: [.normal])
                    ]

    
    var body: some View {
        NavigationView {
            List (0..<friends.count) { index in
                NavigationLink(destination: FriendDetailView(friend: $friends[index])) {
                    Image(systemName: friends[index].icon)
                    
                    VStack(alignment: .leading) {
                        Text(friends[index].name)
                            .bold()
                        
                        HStack {
                            Text(friends[index].school)
                            
                            Spacer()
                            
                            ForEach(friends[index].types, id: \.rawValue) { type in
                                Image(systemName: type.getSymbolName())
                            }

                        }
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
