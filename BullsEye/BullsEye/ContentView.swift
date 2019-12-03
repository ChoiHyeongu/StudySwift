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
    @ObservedObject var timer = TimeCounter()
    
    var body: some View {
        VStack {
            HStack{
                VStack{
                    Color(red: rTarget, green: gTarget, blue: bTarget)
                    self.showAlert ? Text("R: \(Int(rTarget * 255.0))"
                        + "  G: \(Int(gTarget * 255.0))"
                        + "  B: \(Int(bTarget * 255.0))")
                        : Text("Match this color")
                }
                
                VStack{
                    ZStack(alignment: .center){
                        Color(red: rGuess, green: gGuess, blue: bGuess)
                        Text(String(timer.counter))
                            .padding(.all)
                            .background(Color.white)
                            .mask(Circle())
                    }
                    Text("R: \(Int(rGuess*255.0))"
                        + " G: \(Int(gGuess*255.0))"
                        + " G: \(Int(bGuess*255.0))")
                }
            }
            Button(action: {
                self.showAlert = true
                self.timer.killTime()
            }) {
                Text("Hit me!")
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Your Score"),
                      message: Text(String(computeScore())))
            }.padding()
            
            VStack{
                ColorSlide(value: $rGuess, textColor: .red)
                ColorSlide(value: $gGuess, textColor: .green)
                ColorSlide(value: $bGuess, textColor: .blue)
            }.padding(.horizontal)
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
        ContentView(rGuess: 0.8, gGuess: 0.3, bGuess: 0.7)
    }
}

struct ColorSlide: View {
    
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack{
            Text("0").foregroundColor(textColor)
            Slider(value: $value)
                .background(textColor)
                .cornerRadius(10)
            Text("255").foregroundColor(textColor)
        }.padding(.horizontal)
    }
}
