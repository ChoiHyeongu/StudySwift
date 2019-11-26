//
//  MapView.swift
//  GpxParserTest
//
//  Created by 최형우 on 2019/11/26.
//  Copyright © 2019 최형우. All rights reserved.
//

import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    var coordinates: [CLLocationCoordinate2D] = []
    let mapViewDelegate = MapViewDelegate()
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
        var coordinate: CLLocationCoordinate2D
        
        coordinate = self.coordinates[0]
        view.delegate = mapViewDelegate
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.removeAnnotations(view.annotations)
        
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
        MapView()
    }
}
