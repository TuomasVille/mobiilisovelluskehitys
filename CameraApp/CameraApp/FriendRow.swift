//
//  FriendRow.swift
//  CameraApp
//
//  Created by Tuomas Käyhty on 07/02/2020.
//  Copyright © 2020 Tuomas Käyhty. All rights reserved.
//

import SwiftUI

struct FriendRow: View {
    var friend:Friend
    var body: some View {
        NavigationLink(destination: FriendDetailsView(friend: friend)) {
            HStack {
                Image(friend.avatar)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .clipShape(Circle())
                    .frame(width: 80, height: 80)
                VStack (alignment: .leading, spacing: 10) {
                    VStack (alignment: .leading, spacing: 2) {
                        Text(friend.name)
                            .foregroundColor(.primary)
                        Text("\(friend.mutualFriends) mutual friends")
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        Button(action: {
                            print("Add friend")
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(height: 35)
                                    .foregroundColor(.blue)
                                Text("Add Friend")
                                    .font(.system(size: 13))
                                    .foregroundColor(.white)
                                
                            }
                        }
                        Button(action: {
                            print("Remove")
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(height: 35)
                                    .foregroundColor(.gray)
                                Text("Remove")
                                    .font(.system(size: 13))
                                    .foregroundColor(.white)
                                
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct FriendRow_Previews: PreviewProvider {
    static var previews: some View {
        FriendRow(friend: Friend(name: "David G.", mutualFriends: 1, avatar: "david", poster: "sanfransisco"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
