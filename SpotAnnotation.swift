//
//  SpotAnnotation.swift
//  DudeWhere'sMyCar
//
//  Created by Joseph Aharon on 3/17/15.
//  Copyright (c) 2015 Joseph Aharon. All rights reserved.
//

import Foundation
import MapKit

class SpotAnnotation : NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    //var title: String
    //var subtitle: String
    
    //init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
    init(coordinate: CLLocationCoordinate2D!) {
        self.coordinate = coordinate
        //self.title = title
        //self.subtitle = subtitle
    }
    
    
}