//
//  FriendDetailsView.swift
//  CameraApp
//
//  Created by Tuomas Käyhty on 07/02/2020.
//  Copyright © 2020 Tuomas Käyhty. All rights reserved.
//

import SwiftUI

struct FriendDetailsView: View {
    var friend:Friend
    @State var showActionSheet:Bool = false
    @State var showImagePicker:Bool = false
    @State var image:Image?
    @State var sourceType:Int = 0
    
    var body: some View {
        ZStack {
        VStack {
        VStack {
            image?
            .resizable()
            .clipped()
            .clipShape(Circle())
                .shadow(color: .black, radius: 12)
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 160)
            .overlay(CameraButtonView(showActionSheet: $showActionSheet)
                .offset(x: 50, y: 65))
            Text(friend.name)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 12)
        }.offset(y: 200)
        Spacer()
        }
        .actionSheet(isPresented: $showActionSheet, content: { () -> ActionSheet in
        ActionSheet(title: Text("Select Image"), message: Text("Please select an image from the image gallery or use the camera"), buttons: [
        ActionSheet.Button.default(Text("Camera"), action: {
            self.sourceType = 0
            self.showImagePicker.toggle()
        }),
        ActionSheet.Button.default(Text("Photo Gallery"), action: {
            self.sourceType = 1
            self.showImagePicker.toggle()
        }),
        ActionSheet.Button.cancel()
        ])
        })
            if showImagePicker {
                ImagePicker(isVisible: $showImagePicker, image: $image, sourceType: sourceType)
            }
        }.onAppear {
            self.image = Image(self.friend.avatar)
        }.navigationBarTitle(Text(friend.name), displayMode: .inline)
        .background(
        Image("mountain")
            .resizable()
            .scaledToFill()
            .clipped())
            .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct FriendDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailsView(friend: friends[1])
    }
}
