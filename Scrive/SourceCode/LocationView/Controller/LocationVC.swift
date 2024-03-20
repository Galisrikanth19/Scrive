//
//  LocationVC.swift
//  Created by Srikanth on 04/01/24.

import UIKit
import CoreLocation

class LocationVC: BaseViewController {
    @IBOutlet weak var topBar: TopBar!
    @IBOutlet var locationLbl: UILabel!
    
    lazy var locationManager: LocationManager = {
        let locationManager = LocationManager()
        locationManager.delegate = self
        return locationManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
}

// MARK: CustomizeScreen
extension LocationVC {
    private func setupVC() {
        setupTopBar()
    }
}

// MARK: Topbar
extension LocationVC {
    private func setupTopBar() {
        topBar.updateTopBarTitle(WithLeftImage: "LeftArrow", WithTitleStr: "LocationVC")
        topBar.backBtnTapped = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: IBActions
extension LocationVC {
    @IBAction func getLocationOnlyOnce(_ sender: UIButton) {
        locationManager.requestLocation(WithFrenquency: .once)
    }
    
    @IBAction func getLocationContinues(_ sender: UIButton) {
        locationManager.requestLocation(WithFrenquency: .once)
    }
}

// MARK: LocationManagerDelegate
extension LocationVC: LocationManagerDelegate {
    func locationNotDetermined() {
        
    }
    
    func locationRestricted() {
        
    }
    
    func locationDenied() {
        
    }
    
    func locationAuthorized() {
        
    }
    
    func locationUnknown() {
        
    }
    
    func didUpdate(WithLocation location: CLLocation) {
        print("Locations are")
        print(location.coordinate.latitude)
        print(location.coordinate.longitude)
        
        locationLbl.text = "Updated Locations \nLatitude:\(location.coordinate.latitude), \nLongitude:\(location.coordinate.longitude)"
    }
    
    func locationUpdateFailed(WithError error: any Error) {
        
    }
    
    func locationAuthorizationChanged() {
        
    }
}
