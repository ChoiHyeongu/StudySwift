//
//  LabelView.swift
//  TODOAPP
//
//  Created by Choi on 2019/12/16.
//  Copyright © 2019 motivatin. All rights reserved.
//

import SwiftUI

enum Label: String{
    case important = "Important"
    case optional = "Optional"
    case time = "Time"
    case before = "Before"
    case after = "After"
}

struct LabelView: View {
    var name: Label
    var color: Color
    
    init(name: Label){
        self.name = name
        
        switch name {
        case .important:
            color = .red
        case .optional:
            color = .blue
        case .time:
            color = .green
        case .before:
            color = .orange
        case .after:
            color = .yellow
        }
    }
    
    var body: some View {
        Text(self.name.rawValue)
            .font(.system(size: 20))
            .foregroundColor(Color.white)
            .frame(width: 90, height: 40, alignment: .center)
            .background(self.color)
            .cornerRadius(10)
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView(name: .before)
    }
}
