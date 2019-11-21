//
//  UserData.swift
//  Landmarks
//
//  Created by 최형우 on 2019/11/21.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
