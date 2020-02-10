//
//  LandmarkList.swift
//  SwiftUI Turtle Rock
//
//  Created by Tuomas Käyhty on 13/01/2020.
//  Copyright © 2020 Tuomas Käyhty. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @State private var landmark = landmarkData
    @State var showFavoritesOnly = false
    @EnvironmentObject private var userData: UserData
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                NavigationLink(destination: LandmarkDetail(landmark: landmark)
                    .environmentObject(self.userData)
                ) {
                LandmarkRow(landmark: landmark)
                        }
            }
            }
            .onMove(perform: move)
            .onDelete(perform: delete)
        }
        .navigationBarTitle(Text ("Landmarks"))
        .navigationBarItems(trailing: EditButton())
        }
    }
    
    func delete(at offsets: IndexSet) {
        userData.landmarks.remove(atOffsets: offsets)
    }
    func move(from source: IndexSet, to destination: Int) {
        userData.landmarks.move(fromOffsets: source, toOffset: destination)
    }

}

struct LandmarkList_Preview: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .environmentObject(UserData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
