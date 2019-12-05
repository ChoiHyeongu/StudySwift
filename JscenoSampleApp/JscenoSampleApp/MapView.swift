//
//  ContentView.swift
//  JscenoSampleApp
//
//  Created by Choi on 2019/12/03.
//  Copyright © 2019 Choi. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var mode: Bool
    var isStart = true
    var coordinates: [CLLocationCoordinate2D] = []
    var coordinate: CLLocationCoordinate2D?
    
    let mapViewDelegate = MapViewDelegate()
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        view.delegate = mapViewDelegate
        view.translatesAutoresizingMaskIntoConstraints = false
        
        mode ? gpxDrawMode(view, coordinate: coordinate!) :gpxShowMode(view)
    }
    
    /*
     GPX 파일을 열 때
     */
    func gpxShowMode(_ view: MKMapView){
        var coordinate: CLLocationCoordinate2D
        
        coordinate = self.coordinates[0]
        
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
        
        let polyline = MKPolyline(coordinates: self.coordinates, count:
            self.coordinates.count)
        
        view.addOverlay(polyline)
    }
    
    /*
     GPX를 만들 때
     */
    func gpxDrawMode(_ view: MKMapView, coordinate: CLLocationCoordinate2D){
        
        if(isStart){
            view.removeAnnotations(view.annotations)
            view.removeOverlays(view.overlays)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            view.addAnnotation(annotation)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            view.setRegion(region, animated: true)
            
            let polyline = MKPolyline(coordinates: self.coordinates, count:
                self.coordinates.count)
            
            view.addOverlay(polyline)
        }
    }
    
    class MapViewDelegate: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.lineWidth = 10
            renderer.fillColor = UIColor.red.withAlphaComponent(0.5)
            renderer.strokeColor = UIColor.red.withAlphaComponent(0.8)
            return renderer
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(mode: true)
    }
}
