//
//  hospitalMap.swift
//  refugee
//
//  Created by admin on 07/06/19.
//  Copyright © 2019 ACE. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class hospitalMap: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 10000
    var previousLocation: CLLocation?
    
    let geoCoder = CLGeocoder()
    var directionsArray: [MKDirections] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goButton.layer.cornerRadius = goButton.frame.size.height/2
        checkLocationServices()
        mapView.showsUserLocation = true
        
        loadNGOs()
        loadHospitals()
        loadMarket()
    }
    
    func loadHospitals() {
        let madanMohan = hospitalDestination(title: "Madan Mohan Hospital", subtitle: "Located in Delhi", coordinate: CLLocationCoordinate2DMake(28.328, 77.1250))
        mapView.addAnnotation(madanMohan)
        
        let shreeBhikshu = hospitalDestination(title: "Shree Bhikshu Hospital", subtitle: "Located in Delhi", coordinate: CLLocationCoordinate2DMake(28.5041, 77.3025))
        mapView.addAnnotation(shreeBhikshu)
        
        let safdurjung = hospitalDestination(title: "Safdurjang Hospital", subtitle: "Located in Delhi", coordinate: CLLocationCoordinate2DMake(28.5681, 77.2058))
        mapView.addAnnotation(safdurjung)
        
        let jaslok = hospitalDestination(title: "Jaslok Hospital", subtitle: "Located in Mumbai", coordinate: CLLocationCoordinate2DMake(18.971622, 72.80973))
        mapView.addAnnotation(jaslok)
        
        let barc = hospitalDestination(title: "BARC Hospital", subtitle: "Located in Mumbai", coordinate: CLLocationCoordinate2DMake(19.0426, 72.9148))
        mapView.addAnnotation(barc)
        
        let edward = hospitalDestination(title: "King Edward Memorial Hospital", subtitle: "Located in Mumbai", coordinate: CLLocationCoordinate2DMake(19.001444, 72.841238))
        mapView.addAnnotation(edward)
        
        let ipgmer = hospitalDestination(title: "IPGMER Hospital", subtitle: "Located in Kolkata", coordinate: CLLocationCoordinate2DMake(22.6726, 88.4639))
        mapView.addAnnotation(ipgmer)
        
        let rgkar = hospitalDestination(title: "R. G. Kar Hospital", subtitle: "Located in Kolkata", coordinate: CLLocationCoordinate2DMake(22.6044, 88.3783))
        mapView.addAnnotation(rgkar)
        
        let brsingh = hospitalDestination(title: "B. R. Singh Hospital", subtitle: "Located in Kolkata", coordinate: CLLocationCoordinate2DMake(22.5658, 88.3704))
        mapView.addAnnotation(brsingh)
        
        let ent = hospitalDestination(title: "ENT Hospital", subtitle: "Located in Bangalore", coordinate: CLLocationCoordinate2DMake(13.006752, 77.561737))
        mapView.addAnnotation(ent)
        
        let bmcri = hospitalDestination(title: "BMCRI Hospital", subtitle: "Located in Banglore", coordinate: CLLocationCoordinate2DMake(12.959383, 77.574742))
        mapView.addAnnotation(bmcri)
        
        let victoria = hospitalDestination(title: "Victoria Hospital", subtitle: "Located in Bangalore", coordinate: CLLocationCoordinate2DMake(12.9636, 77.5738))
        mapView.addAnnotation(victoria)
        
    }
    
    func loadMarket() {
        let connaught = marketDestination(title: "Connaught Market", subtitle: "Located in Delhi", coordinate: CLLocationCoordinate2DMake(28.6304, 77.2177))
        mapView.addAnnotation(connaught)
        
        let chandniChowk = marketDestination(title: "Chandni Chowk", subtitle: "Located in Delhi", coordinate: CLLocationCoordinate2DMake(28.5503, 77.231))
        mapView.addAnnotation(chandniChowk)
        
        let nehru = marketDestination(title: "Nehru Market", subtitle: "Located in Delhi", coordinate: CLLocationCoordinate2DMake(28.656, 77.2502))
        mapView.addAnnotation(nehru)
        
        let colaba = marketDestination(title: "Colaba Causseway", subtitle: "Located in Mumbai", coordinate: CLLocationCoordinate2DMake(18.91, 72.8099))
        mapView.addAnnotation(colaba)
        
        let chor = marketDestination(title: "Chor Bazzar", subtitle: "Located in Mumbai", coordinate: CLLocationCoordinate2DMake(18.9605, 72.8521))
        mapView.addAnnotation(chor)
        
        let crawford = marketDestination(title: "Crawford Market", subtitle: "Located in Mumbai", coordinate: CLLocationCoordinate2DMake(18.9477, 72.8342))
        mapView.addAnnotation(crawford)
        
        let new = marketDestination(title: "New Market", subtitle: "Located in Kolkata", coordinate: CLLocationCoordinate2DMake(22.5603, 88.3523))
        mapView.addAnnotation(new)
        
        let dakshinapan = marketDestination(title: "Dakshinapan Shopping Center", subtitle: "Located in Kolkata", coordinate: CLLocationCoordinate2DMake(22.3032, 88.2159))
        mapView.addAnnotation(dakshinapan)
        
        let chowringhee = marketDestination(title: "Chowringhee Road", subtitle: "Located in Kolkata", coordinate: CLLocationCoordinate2DMake(22.5626, 88.36304))
        mapView.addAnnotation(chowringhee)
        
        let commercial = marketDestination(title: "Commercial Street", subtitle: "Located in Bangalore", coordinate: CLLocationCoordinate2DMake(12.972442, 12.972442))
        mapView.addAnnotation(commercial)
        
        let gandhi = marketDestination(title: "Gandhi Bazzar", subtitle: "Located in Banglore", coordinate: CLLocationCoordinate2DMake(12.9456, 77.5713))
        mapView.addAnnotation(gandhi)
        
        let national = marketDestination(title: "National Market", subtitle: "Located in Bangalore", coordinate: CLLocationCoordinate2DMake(12.9865, 77.5804))
        mapView.addAnnotation(national)
        
    }
    
    func loadNGOs() {
        let lucknowNGO = NGODestination(title: "Aadarsh Gramin Sewa Sansthan", subtitle: "Located in Lucknow", coordinate: CLLocationCoordinate2DMake(26.879129, 81.040222))
        mapView.addAnnotation(lucknowNGO)
        
        let delhiNGO = NGODestination(title: "Nai Peedhi Nai Soch", subtitle: "Located in Delhi", coordinate: CLLocationCoordinate2DMake(28.4028, 77.1542))
        mapView.addAnnotation(delhiNGO)
        
        let kolkataNGO = NGODestination(title: "Association of Alternative Medicines", subtitle: "Located in kolkata", coordinate: CLLocationCoordinate2DMake(22.5726, 88.3639))
        mapView.addAnnotation(kolkataNGO)
        
        let karnatakaNGO = NGODestination(title: "1 India NGO", subtitle: "Located in Karnataka", coordinate: CLLocationCoordinate2DMake(15.3173, 75.7139))
        mapView.addAnnotation(karnatakaNGO)
        
        let mumbaiNGO = NGODestination(title: "Human Welfare Trust", subtitle: "Located in Mumbai", coordinate: CLLocationCoordinate2DMake(19.0764, 72.8777))
        mapView.addAnnotation(mumbaiNGO)
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // Show alert letting the user know they have to turn this on.
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            startTackingUserLocation()
        case .denied:
            // Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        }
    }
    
    func startTackingUserLocation() {
        mapView.showsUserLocation = true
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(for: mapView)
    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    func getDirections() {
        guard let location = locationManager.location?.coordinate else {
            //TODO: Inform user we don't have their current location
            return
        }
        
        let request = createDirectionsRequest(from: location)
        let directions = MKDirections(request: request)
        resetMapView(withNew: directions)
        
        directions.calculate { [unowned self] (response, error) in
            //TODO: Handle error if needed
            guard let response = response else { return } //TODO: Show response not available in an alert
            
            for route in response.routes {
                self.mapView.addOverlay(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
    
    func createDirectionsRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request {
        let destinationCoordinate       = getCenterLocation(for: mapView).coordinate
        let startingLocation            = MKPlacemark(coordinate: coordinate)
        let destination                 = MKPlacemark(coordinate: destinationCoordinate)
        
        let request                     = MKDirections.Request()
        request.source                  = MKMapItem(placemark: startingLocation)
        request.destination             = MKMapItem(placemark: destination)
        request.transportType           = .automobile
        request.requestsAlternateRoutes = true
        
        return request
    }
    
    func resetMapView(withNew directions: MKDirections) {
        mapView.removeOverlays(mapView.overlays)
        directionsArray.append(directions)
        let _ = directionsArray.map { $0.cancel() }
    }
    
    
    @IBAction func goButtonTapped(_ sender: UIButton) {
        getDirections()
    }

}

class NGODestination: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}

class hospitalDestination: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}

class marketDestination: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}

extension hospitalMap: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

extension hospitalMap: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        
        guard let previousLocation = self.previousLocation else { return }
        
        guard center.distance(from: previousLocation) > 50 else { return }
        self.previousLocation = center
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            
            if let _ = error {
                //TODO: Show alert informing the user
                return
            }
            
            guard let placemark = placemarks?.first else {
                //TODO: Show alert informing the user
                return
            }
            
//            let streetNumber = placemark.subThoroughfare ?? ""
            let streetName = placemark.thoroughfare ?? ""
            
            DispatchQueue.main.async {
                self.addressLabel.text = "\(streetName)"
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        renderer.strokeColor = .blue
        
        return renderer
    }
}

