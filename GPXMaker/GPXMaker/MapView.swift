//
//  MapView.swift
//  GPXMaker
//
//  Created by Choi on 2019/12/03.
//  Copyright © 2019 Choi. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var coordinate: CLLocationCoordinate2D
    var gpxLocations: [GPXLocation] = []
    var isStart =  true
    let mapViewDelegate = MapViewDelegate()
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
        view.delegate = mapViewDelegate
        view.translatesAutoresizingMaskIntoConstraints = false
        
        if(isStart){
            
            view.removeAnnotations(view.annotations)
            view.removeOverlays(view.overlays)
            print ("Overays: \(view.overlays.count)")
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            view.addAnnotation(annotation)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            view.setRegion(region, animated: true)
            
            let coordinates = getCoordinates()
            
            let polyline = MKPolyline(coordinates: coordinates, count: coordinates.count )
            
            view.addOverlay(polyline)
        }
    }
    
    func getCoordinates() -> [CLLocationCoordinate2D]{
        var coordinates: [CLLocationCoordinate2D] = []
        
        for location in gpxLocations {
            let coordinate = location.coordinate
            coordinates.append(coordinate)
        }
        
        return coordinates
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
        MapView(coordinate: CLLocationCoordinate2DMake(35.682117, 139.774669), isStart: true )
    }
}
