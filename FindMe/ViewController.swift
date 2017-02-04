//
//  ViewController.swift
//  FindMe
//
//  Created by Melissa  Garrett on 2/4/17.
//  Copyright © 2017 MelissaGarrett. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!
    @IBOutlet weak var hAccuracyLabel: UILabel!
    @IBOutlet weak var vAccuracyLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true // to show blue dot
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Grab the most recent location in array (the last element in array)
        let lastLocation = locations[locations.count - 1]
        
        // Set the last location on the app's interface
        latitudeLabel.text = String(format: "%.6f", lastLocation.coordinate.latitude)
        longitudeLabel.text = String(format: "%.6f", lastLocation.coordinate.longitude)
        altitudeLabel.text = String(format: "%.6f", lastLocation.altitude)
        hAccuracyLabel.text = String(format: "%.6f", lastLocation.horizontalAccuracy)
        vAccuracyLabel.text = String(format: "%.6f", lastLocation.verticalAccuracy)
        
        animateMap(lastLocation)
    }
    
    func animateMap(_ location: CLLocation) {
        // Animate the mapview to this region
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, 1000, 1000)
        mapView.setRegion(region, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

