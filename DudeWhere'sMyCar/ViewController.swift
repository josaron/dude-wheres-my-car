//
//  ViewController.swift
//  DudeWhere'sMyCar
//
//  Created by Joseph Aharon on 3/15/15.
//  Copyright (c) 2015 Joseph Aharon. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var savedLocation: UILabel!
    
    var manager: CLLocationManager!
    var myLocations: [CLLocation] = []
    
    var carAnnotation: MKAnnotation!
    var userAnnotation: MKAnnotation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup our location manager
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        // Setup our map view
        map.delegate = self
        map.mapType = MKMapType.Standard
        map.showsUserLocation = true
        
        userAnnotation = SpotAnnotation(coordinate: manager.location.coordinate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveLocation(sender: AnyObject) {
        var location = manager.location
        savedLocation.text = location.description
        carAnnotation = SpotAnnotation(coordinate: location.coordinate)
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        // NEED TO FIX KEY/VALUE ISSUE
        //userAnnotation.setCoordinate!(manager.location.coordinate)
        userLocation.text = manager.location.description
        
        /*label.text = "\(locations[0])"
        myLocations.append(locations[0] as CLLocation)
        
        let spanX = 0.007
        let spanY = 0.007
        var newRegion = MKCoordinateRegion(center: map.userLocation.coordinate, span: MKCoordinateSpanMake(spanX, spanY))
        map.setRegion(newRegion, animated: true)
        if (myLocations.count > 1) {
            var sourceIndex = myLocations.count - 1
            var destinationIndex = myLocations.count - 2
            let c1 = myLocations[sourceIndex].coordinate
            let c2 = myLocations[destinationIndex].coordinate
            var a = [c1, c2]
            var polyLine = MKPolyline(coordinates: &a, count: a.count)
            map.addOverlay(polyLine)
        }*/
    }
    
    /*func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if (overlay is MKPolyline) {
            var polyLineRenderer = MKPolylineRenderer(overlay: overlay)
            polyLineRenderer.strokeColor = UIColor.blueColor()
            polyLineRenderer.lineWidth = 4
            return polyLineRenderer
        }
        return nil
    }*/
}

