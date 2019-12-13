//
//  ContentView.swift
//  PropertyWrapper
//
//  Created by Choi on 2019/12/13.
//  Copyright © 2019 motivatin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = "username"
    
    var body: some View {
        VStack{
            Text(username)
                .fontWeight(.bold)
                .padding()
            BindingView(username: $username)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
