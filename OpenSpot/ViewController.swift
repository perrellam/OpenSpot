//
//  ViewController.swift
//  OpenSpot
//
//  Created by Mason Perrella on 9/18/18.
//  Copyright © 2018 Mason Perrella. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle:String, pinSubTitle:String,location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}

class ViewController: UIViewController, CLLocationManagerDelegate {

    //Map
    @IBOutlet weak var map: MKMapView!
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
       //print(location.coordinate.latitude)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        let point1 = CLLocationCoordinate2D(latitude:30.175706, longitude:-81.621965)
        let point2 = CLLocationCoordinate2D(latitude:30.175702, longitude:-81.621941)
        let point3 = CLLocationCoordinate2D(latitude:30.175739, longitude:-81.621921)
        let point4 = CLLocationCoordinate2D(latitude:30.175722, longitude:-81.621907)
        let car = CLLocationCoordinate2D(latitude:30.175749, longitude:-81.621910)

        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.00001 ,0.00001)
        
//        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
       let myLocation:CLLocationCoordinate2D = point1
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region, animated: true)
        
        let pin1 = customPin(pinTitle: "point1", pinSubTitle: "", location: point1)
        let pin2 = customPin(pinTitle: "point2", pinSubTitle: "", location: point2)
        let pin3 = customPin(pinTitle: "point3", pinSubTitle: "", location: point3)
        let pin4 = customPin(pinTitle: "point4", pinSubTitle: "", location: point4)
        let carpin = customPin(pinTitle: "car", pinSubTitle: "", location: car)

        
        map.addAnnotation(pin1)
        map.addAnnotation(pin2)
        map.addAnnotation(pin3)
        map.addAnnotation(pin4)
        map.addAnnotation(carpin)
        
//comment test

//        print("vert acc: ", location.verticalAccuracy)
//        print("vert acc: ", location.horizontalAccuracy)
//
//        print(location.coordinate.latitude)
//        print(location.coordinate.longitude)
//
        
        //map.showsUserLocation = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

