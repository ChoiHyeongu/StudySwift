//
//  ContentView.swift
//  PublishedWrapper
//
//  Created by Choi on 2019/12/18.
//  Copyright © 2019 motivatin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var num = 0
    
    var body: some View {
        VStack{
            Text(String(num))
            Button(action: {self.num+=1}) {
                Text("Click")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
