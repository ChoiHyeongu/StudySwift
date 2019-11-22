//
//  MapView.swift
//  MapTracking
//
//  Created by Choi on 2019/11/21.
//  Copyright © 2019 Choi. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @State var isStart: DarwinBoolean = false
    
    init(isStart: DarwinBoolean) {
        self.isStart = isStart
    }
    
    
    func makeCoordinator() -> MapView.Coordinator {
        return MapView.Coordinator(isStart: isStart)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        
        let map = MKMapView()
        
        let sourceCoordinate = CLLocationCoordinate2D(latitude: 13.086, longitude: 80.2707)
        
        let destinationCoordinate = CLLocationCoordinate2D(latitude: 12.9830, longitude: 80.2594)
        
        let region = MKCoordinateRegion(center: sourceCoordinate, latitudinalMeters: 100000, longitudinalMeters: 100000)
        
        let sourcePin = MKPointAnnotation()
        sourcePin.coordinate = sourceCoordinate
        sourcePin.title = "Source"
        map.addAnnotation(sourcePin)
        
        let destinationPin = MKPointAnnotation()
        destinationPin.coordinate = destinationCoordinate
        destinationPin.title = "Destination"
        map.addAnnotation(destinationPin)
        
        map.region = region
        map.delegate = context.coordinator
        
        let req = MKDirections.Request()
        req.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceCoordinate))
        req.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinate))
        
        let directions = MKDirections(request: req)
        
        directions.calculate{(direct, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            let polyline = direct?.routes.first?.polyline
            map.addOverlay(polyline!)
            map.setRegion(MKCoordinateRegion(polyline!.boundingMapRect), animated: true)
        }
        
        return map
    }
    
    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
    }
    
    class Coordinator: NSObject, MKMapViewDelegate{
        
        @State var isStart: DarwinBoolean = false
        
        init(isStart: DarwinBoolean) {
            self.isStart = isStart
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) ->
            MKOverlayRenderer {
                if !self.isStart.boolValue{
                    let render = MKPolylineRenderer(overlay: overlay)
                    render.strokeColor = .orange
                    render.lineWidth = 2
                    return render
                } else {
                    let render = MKPolylineRenderer(overlay: overlay)
                    return render
                }
        }
    }
}


struct MapView_Preview: PreviewProvider {
    static var previews: some View {
        MapView(isStart: false)
    }
}
