//
//  ContentView.swift
//  Kuchi
//
//  Created by Choi on 2019/12/09.
//  Copyright © 2019 motivatin. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image("welcome-background", bundle: nil)
                .resizable()
                .aspectRatio(1 / 1, contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .saturation(0.5)
                .blur(radius: 5)
                .opacity(0.08)
            
            HStack {
                Image(systemName: "table")
                    .resizable()
                    .frame(width: 60, height: 60, alignment: .center)
                    .cornerRadius(60 / 2)
                    .background(Color(white: 0.9))
                    .clipShape(Circle())
                    .foregroundColor(.red)
                VStack{
                    Text("Welcome to")
                        .font(.headline)
                        .bold()
                    Text("Kunchi!")
                        .font(.largeTitle)
                        .bold()
                }
                .foregroundColor(.red)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
