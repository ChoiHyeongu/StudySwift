//
//  DetailView.swift
//  TODOAPP
//
//  Created by Choi on 2019/12/14.
//  Copyright © 2019 motivatin. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Text("Detail View")
            .navigationBarItems(trailing: backButton)
    }
    
    var backButton: some View {
        Button(action:  {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image("ic_back")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
