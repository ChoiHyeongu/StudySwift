//
//  MapView.swift
//  LocationObserverMap
//
//  Created by Choi on 2019/11/24.
//  Copyright © 2019 Choi. All rights reserved.
//

import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    var coordinates: [CLLocationCoordinate2D] = []
    var isStart =  false
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        if(isStart){
            let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            view.setRegion(region, animated: true)
            view.removeAnnotations(view.annotations)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            view.addAnnotation(annotation)
        } else {
            printCoordinates()
        }
    }
    
    func printCoordinates(){
        var cnt = 0
        for i in self.coordinates {
            print ("Coordinate : \(i.latitude), \(i.longitude)")
            cnt += 1
        }
        
        print ("END \(cnt)")
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2DMake(35.682117, 139.774669), isStart: true)
    }
}
