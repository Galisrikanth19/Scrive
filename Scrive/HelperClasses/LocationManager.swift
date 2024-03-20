//
//  LocationManager.swift
//  Created by Srikanth on 15/03/24.

import UIKit
import CoreLocation

/*
 Need to add below values in plist
 
 <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
 <string>App_Name requires user’s location for better user experience.</string>

 <key>NSLocationAlwaysUsageDescription</key>
 <string>App_Name requires user’s location for better user experience.</string>

 <key>NSLocationWhenInUseUsageDescription</key>
 <string>App_Name requires user’s location for better user experience.</string>
 */

enum LocationFrequencyType {
    case once
    case continues
}

protocol LocationManagerDelegate: AnyObject {
    func locationNotDetermined()
    func locationRestricted()
    func locationDenied()
    
    func locationAuthorized()
    func locationUnknown()
    
    func didUpdate(WithLocation location: CLLocation)
    func locationUpdateFailed(WithError error: Error)
    func locationAuthorizationChanged()
}

class LocationManager: NSObject {
    private let clLocationManager = CLLocationManager()
    weak var delegate: LocationManagerDelegate?
    
    private var initialLoaded: Bool!
    private var clLocation: CLLocation?
    
    override init() {
        super.init()
        setupCLLocationManager()
    }
    
    private func setupCLLocationManager() {
        initialLoaded = true
        clLocationManager.delegate = self
        clLocationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestLocation(WithFrenquency frequency: LocationFrequencyType) {
        self.clLocation = nil
        checkAuthorizationStatus()
    }
    
    func checkAuthorizationStatus() {
        let authorizationStatus = CLLocationManager.authorizationStatus()
        switch authorizationStatus {
            case .notDetermined:
                delegate?.locationNotDetermined()
                clLocationManager.requestWhenInUseAuthorization()
            
            case .restricted:
                delegate?.locationRestricted()
            
            case .denied:
                delegate?.locationDenied()
                
            case .authorizedAlways, .authorizedWhenInUse:
                delegate?.locationAuthorized()
                clLocationManager.requestLocation()
            
            @unknown default:
                delegate?.locationUnknown()
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            if self.clLocation == nil {
                self.clLocation = location
                delegate?.didUpdate(WithLocation: location)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        delegate?.locationUpdateFailed(WithError: error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        delegate?.locationAuthorizationChanged()
        if initialLoaded == true {
            initialLoaded.toggle()
        } else {
            checkAuthorizationStatus()
        }
    }
}
