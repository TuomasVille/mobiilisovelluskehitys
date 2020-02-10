//
//  UserData.swift
//  SwiftUI Turtle Rock
//
//  Created by Tuomas Käyhty on 20/01/2020.
//  Copyright © 2020 Tuomas Käyhty. All rights reserved.
//


import SwiftUI
import Combine

final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
