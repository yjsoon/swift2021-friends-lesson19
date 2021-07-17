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
    @State var isSheetPresented = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(friends) { friend in
                    let friendIndex = friends.firstIndex(of: friend)!
                    NavigationLink(destination: FriendDetailView(friend: $friends[friendIndex])) {
                        Image(systemName: friend.icon)
                        
                        VStack(alignment: .leading) {
                            Text(friend.name)
                                .bold()
                            
                            HStack {
                                Text(friend.school)
                                
                                Spacer()
                                
                                ForEach(friend.types, id: \.rawValue) { type in
                                    Image(systemName: type.getSymbolName())
                                }
                                
                            }
                            .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete{ offsets in
                    friends.remove(atOffsets: offsets)
                }
                .onMove { source, destination in
                    friends.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationTitle("Friends")
            .navigationBarItems(leading: EditButton(),
                                trailing: Button("Add Friend") {
                                    isSheetPresented = true
                                })
            
        }
        .sheet(isPresented: $isSheetPresented) {
            NewFriendView(friends: $friends)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
