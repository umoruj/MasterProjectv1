//
//  GeoLocFenceViewController.swift
//  MasterProjectv1
//
//  Created by Umoru Joseph on 4/10/16.
//  Copyright © 2016 Umoru Joseph. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class GeoLocFenceViewController: UIViewController, CLLocationManagerDelegate {
    
    var cl: CLLocationManager?

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cl = CLLocationManager()
        cl?.requestWhenInUseAuthorization()
        cl?.desiredAccuracy = kCLLocationAccuracyBest
        cl?.startUpdatingLocation()
        cl?.delegate = self
        
        //mapView.showsUserLocation = true
        //mapView.userTrackingMode = MKUserTrackingMode.Follow

    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let myCor = locations[locations.count - 1]
        
        let myLat = myCor.coordinate.latitude
        let myLong = myCor.coordinate.longitude
        
        let myCoor2d = CLLocationCoordinate2D(latitude: myLat, longitude: myLong)
        
        let myLatDelta = 0.5
        let myLongDelta = 0.5
        
        let mySpan = MKCoordinateSpan(latitudeDelta: myLatDelta, longitudeDelta: myLongDelta)
        
        let myRegion = MKCoordinateRegion(center: myCoor2d, span: mySpan)
        
        mapView.setRegion(myRegion, animated: true)
        
        let myAnno = MKPointAnnotation()
        
        myAnno.coordinate = myCoor2d
        mapView.addAnnotation(myAnno)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
