//
//  ContentView.swift
//  BullsEye
//
//  Created by Choi on 2019/11/29.
//  Copyright © 2019 Choi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    @State var showAlert = false
    
    var body: some View {
        VStack {
            HStack{
                VStack{
                    Color(red: rTarget, green: gTarget, blue: bTarget)
                    Text("Match this color")
                }
                
                VStack{
                    Color(red: rGuess, green: gGuess, blue: bGuess)
                    Text("R: \(Int(rGuess*255.0))"
                        + " G: \(Int(gGuess*255.0))"
                        + " G: \(Int(bGuess*255.0))")
                }
            }
            Button(action: {self.showAlert = true }) {
                Text("Hit me!")
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Your Score"),
                      message: Text(String(computeScore())))
            }.padding()
            
            ColorSlide(value: $rGuess, textColor: .red)
            ColorSlide(value: $gGuess, textColor: .green)
            ColorSlide(value: $bGuess, textColor: .blue)
        }
    }
    
    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        return Int((1.0 - diff) * 100.0 + 0.5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.8, gGuess: 0.3, bGuess: 0.7).previewLayout(.fixed(width: 568, height: 320))
    }
}

struct ColorSlide: View {
    
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack{
            Text("0").foregroundColor(textColor)
            Slider(value: $value)
            Text("255").foregroundColor(textColor)
        }.padding(.horizontal)
    }
}
