//
//  Taxi.swift
//  Map
//
//  Created by Abu Nabe on 26/2/2023.
//

import UIKit
import GoogleMaps
import CoreLocation

class Taxi: UIViewController{
    
    let locationManager = CLLocationManager()
       
    var zoom: Float = 15
    
    var longtude = ["-122.414317", "-122.410317", "-122.401217"]
    var latitude = ["37.787834", "37.778834", "37.783834"]
    var username = ["Josh", "Stephanie", "Mike"]
    var pic = ["1", "2", "3"]
    let mapView: GMSMapView = {
        let map = GMSMapView()
        
        return map
    }()
    
    private let zoomIn: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(systemName: "plus.app")?.withRenderingMode(.alwaysTemplate)
        imageview.tintColor = .green
        imageview.contentMode = UIView.ContentMode.scaleAspectFit
        imageview.isHidden = true
        return imageview
    }()
    
    private let zoomOut: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(systemName: "minus.square")?.withRenderingMode(.alwaysTemplate)
        imageview.tintColor = .red
        imageview.contentMode = UIView.ContentMode.scaleAspectFit
        imageview.isHidden = true
        return imageview
    }()
    
    private let centerView2: UIView = {
          let view = UIView()
          view.backgroundColor = UIColor(named: "Basic")
          
          return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mapView)
        view.addSubview(zoomIn)
        view.addSubview(zoomOut)
        view.addSubview(centerView2)
        
        mapView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
        
        do {
            if let styleURL = Bundle.main.url(forResource: "night_mode", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                print("XAS", "Unable to find style.json")
            }
        } catch {
            print("XAS","One or more of the map styles failed to load. \(error)")
        }
        
        centerView2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
             centerView2.anchor(paddingTop: 0)
        
        zoomIn.anchor(bottom: centerView2.topAnchor, right: view.rightAnchor, paddingBottom: 5, paddingRight: 10, width: 30, height: 30)
               
        zoomOut.anchor(top: centerView2.bottomAnchor, right: view.rightAnchor, paddingTop: 5, paddingRight: 10, width: 30, height: 30)
                
        locationManager.delegate = self
        mapView.delegate = self
        
        relocateLocation()
        let zoomInTap = UITapGestureRecognizer(target: self, action: #selector(ZoomIn))
              zoomIn.isUserInteractionEnabled = true
              zoomIn.addGestureRecognizer(zoomInTap)
              
        let zoomOutTap = UITapGestureRecognizer(target: self, action: #selector(ZoomOut))
        zoomOut.isUserInteractionEnabled = true
        zoomOut.addGestureRecognizer(zoomOutTap)
    }
    
    @objc func ZoomIn(_ sender: UIButton) {
        let nextZoom = zoom + 1
        mapView.animate(toZoom: nextZoom)
    }
    
    @objc func ZoomOut(_ sender: UIButton) {
        let nextZoom = zoom - 1
        mapView.animate(toZoom: nextZoom)
    }
    
    @objc func relocateLocation()
    {
        let authorizationStatus: CLAuthorizationStatus
   
        if #available(iOS 14, *) {
            authorizationStatus = locationManager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()

        }
        
        if CLLocationManager.locationServicesEnabled() {
            
            
            switch authorizationStatus {
            case .notDetermined:
                // Request when-in-use authorization initially
                // This is the first and the ONLY time you will be able to ask the user for permission
                self.locationManager.delegate = self
                locationManager.requestWhenInUseAuthorization()
                break
                
            case .restricted, .denied:
                // Disable location features
                PermissionAlert.MapPermission(navigationController: navigationController!)
                
                break
                
            case .authorizedWhenInUse, .authorizedAlways:
                // Enable features that require location services here.
                print("XAS Full Access")
                locationManager.requestLocation()
                locationManager.startUpdatingLocation()
                
                //5
                mapView.isMyLocationEnabled = true
                mapView.settings.myLocationButton = true
                
                break
            }
        }
    }
    
    func configureLocation(){
        for (position, element) in longtude.enumerated(){
            print("XAS")
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: Double(latitude[position])!, longitude: Double(longtude[position])!)
            
            marker.snippet = username[position]
            
            marker.icon = self.drawImageWithProfilePic(pp: UIImage(named: pic[position])!)
    
            
            marker.appearAnimation = GMSMarkerAnimation.pop
            marker.map = self.mapView
            
            marker.map = mapView
        }
    }
    
    func drawImageWithProfilePic(pp: UIImage) -> UIImage {
         
         //            let imgView = UIImageView(image: image)
         //             imgView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
         
         let picImgView = UIImageView(image: pp)
         picImgView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
         
         
         picImgView.center.x = view.center.x
         picImgView.center.y = view.center.y - 7
         picImgView.layer.cornerRadius = picImgView.frame.width/2
         picImgView.clipsToBounds = true
         picImgView.setNeedsLayout()
         
         let newImage = imageWithView(view: picImgView)
         return newImage
     }
    
    func imageWithView(view: UIView) -> UIImage {
           var image: UIImage?
           UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
           if let context = UIGraphicsGetCurrentContext() {
               view.layer.render(in: context)
               image = UIGraphicsGetImageFromCurrentImageContext()
               UIGraphicsEndImageContext()
           }
           return image ?? UIImage()
       }
}
extension Taxi: CLLocationManagerDelegate, GMSMapViewDelegate {
        // 2
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            // 3
        
            guard status == .authorizedWhenInUse else {
                
                return
            }
                        
            locationManager.startUpdatingLocation()
            
            //5
            mapView.isMyLocationEnabled = true
            mapView.settings.myLocationButton = true
            
        }
        
        // 6
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            guard let location = locations.first else {
                return
            }
                        
                  
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0)
            
            marker.snippet = "You"
            
            print("XAS", locationManager.location?.coordinate.longitude)
            print("XAS", locationManager.location?.coordinate.latitude)
            
    
            zoomIn.isHidden = false
            zoomOut.isHidden = false
            
            marker.appearAnimation = GMSMarkerAnimation.pop
            marker.map = mapView
            
            // 7
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            
            // 8
           
            configureLocation()
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print(error)
        }
        
        func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
            zoom = mapView.camera.zoom
        }
        
        func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
            
                let vc = MapViewSheet()
                vc.modalPresentationStyle = .overCurrentContext
                vc.NameLabel.text = marker.snippet!
                // Keep animated value as false
                // Custom Modal presentation animation will be handled in VC itself
                self.present(vc, animated: false)
            
            return false // or false as needed.
        }
}
