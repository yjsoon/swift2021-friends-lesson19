//
//  Friend.swift
//  Friends
//
//  Created by YJ Soon on 3/7/21.
//

import Foundation

struct Friend: Identifiable {
    
    var id = UUID()
    
    var name: String
    var icon: String
    var school: String
    
    var slothImage: String
    
    var attack: Double = .random(in: 0...15)
    var defence: Double = .random(in: 0...15)
    
    var types: [FriendType]
    
}
