//
//  GPXListView.swift
//  JscenoSampleApp
//
//  Created by Choi on 2019/12/03.
//  Copyright © 2019 Choi. All rights reserved.
//

import SwiftUI

struct GPXListView: View {
    
    let gpxManager = GPXManager()
    var gpxs = [GPX(title: "수리산"), GPX(title: "북한산")]
    
    var body: some View {
        NavigationView{
            List(self.gpxs, id:\.title){ gpx in
                NavigationLink(destination: MapView(mode: false, coordinates: self.gpxManager.getCoordinates(path: gpx.path))){
                    Text(gpx.title)
                }
            }
            .navigationBarItems(trailing:
                NavigationLink(destination: CreateGPXView()){
                    Image(systemName: "plus")
                
                    .foregroundColor(Color.black)
                }
            )
                .navigationBarTitle(Text("경로 선택"))
        }
    }
}

struct GPXListView_Previews: PreviewProvider {
    static var previews: some View {
        GPXListView()
    }
}
