//
//  ViewController.swift
//  mapsUygulamasi
//
//  Created by Mürşide Gökçe on 23.10.2024.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var labelEnlem: UILabel!
    @IBOutlet weak var labelBoylam: UILabel!
    @IBOutlet weak var labelHiz: UILabel!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //konumu üst derece hassaiyet ile alır fakat şarjı fazla harcayabilir
        
        locationManager.requestWhenInUseAuthorization()//konum izni için bildirim verir
        
        locationManager.startUpdatingLocation() //konumu sürekli güncelleyerek verir
        locationManager.delegate = self
        
//        let konum = CLLocationCoordinate2D(latitude: 41.0370175, longitude: 28.974792)
//        
//        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//        //yakınlık
//        let bolge = MKCoordinateRegion(center: konum, span: span)
//        mapView.setRegion(bolge, animated: true)
//        
//        let pin = MKPointAnnotation()
//        pin.coordinate = konum
//        pin.title = "Taksim"
//        pin.subtitle = "Taksim Square"
//        mapView.addAnnotation(pin)

    }


}

extension ViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonKonum = locations[locations.count-1]
        
        
        let enlem = sonKonum.coordinate.latitude
        let boylam = sonKonum.coordinate.longitude
        
        labelEnlem.text = " enlem: \(enlem)"
        labelBoylam.text = " boylam :  \(boylam)"
        
        labelHiz.text = "hiz: \(sonKonum.speed)"
        
        let konum=CLLocationCoordinate2D(latitude: enlem, longitude: boylam)
        
                let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                //yakınlık
                let bolge = MKCoordinateRegion(center: konum, span: span)
                mapView.setRegion(bolge, animated: true)
        
                /*let pin = MKPointAnnotation()
                pin.coordinate = konum
                pin.title = "\(enlem) - \(boylam)"
                pin.subtitle = "konum"
                mapView.addAnnotation(pin)*/
        mapView.showsUserLocation = true
        
        
    }
}

