//
//  CircleImage.swift
//  SwiftUITutorial
//
//  Created by 최형우 on 2019/11/20.
//  Copyright © 2019 최형우. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
        .overlay(
            Circle().stroke(Color.white, lineWidth: 4)
        .shadow(radius: 10)
        )
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
 
