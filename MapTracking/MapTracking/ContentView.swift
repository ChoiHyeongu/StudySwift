//
//  ContentView.swift
//  MapTracking
//
//  Created by Choi on 2019/11/21.
//  Copyright © 2019 Choi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isStart:DarwinBoolean = false
    
    var body: some View {
        VStack {
            MapView(isStart: self.isStart)
                .edgesIgnoringSafeArea(.all)
            HStack{
                Button(action: {
                    if self.isStart.boolValue{
                        self.isStart = false
                    } else {
                        self.isStart = true
                    }
                }) {
                    Text(!isStart.boolValue ? "Start" : "Stop")
                        .font(.title)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
