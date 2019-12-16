//
//  TodoInputView.swift
//  TODOAPP
//
//  Created by Choi on 2019/12/14.
//  Copyright © 2019 motivatin. All rights reserved.
//

import SwiftUI

struct TodoInputView: View {
    
    @State var title: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Text("제목")
                .font(.headline)
            TextField("제목을 입력하세요.", text: $title)
        }
    }
}

struct TodoInputView_Previews: PreviewProvider {
    static var previews: some View {
        TodoInputView()
    }
}
