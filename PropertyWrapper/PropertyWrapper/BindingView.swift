//
//  BindingTest.swift
//  PropertyWrapper
//
//  Created by Choi on 2019/12/13.
//  Copyright © 2019 motivatin. All rights reserved.
//

import SwiftUI

struct BindingView: View {
    
    @Binding private var username: String
    
    init(username: Binding<String>){
        self._username = username
    }
    
    var body: some View {
        VStack{
            Text("이름을 입력하세요.")
            TextField("Unsername : ", text: $username)
                .multilineTextAlignment(.center)
        }
    }
}

struct BindingTest_Previews: PreviewProvider {
    
    @State static var username: String = "Username"
    
    static var previews: some View {
        BindingView(username: $username)
    }
}
