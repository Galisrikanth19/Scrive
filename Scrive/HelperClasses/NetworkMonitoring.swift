//
//  NetworkMonitoring.swift
//  Created by Srikanth on 01/01/23

import Network
import UIKit

class NetworkMonitoring {
    static let shared = NetworkMonitoring()
    private var monitor: NWPathMonitor?
    private var isMonitoring = false
    
    // use it to notified that monitoring did start.
    var didStartMonitoringHandler: (() -> Void)?
    
    // use it to notified that monitoring did stopped.
    var didStopMonitoringHandler: (() -> Void)?
    
    // use it to monitor the network status changes.
    var netStatusChangeHandler: (() -> Void)?
    
    // use it to check network is connected or not.
    var isConnected: Bool {
        guard let monitor = monitor else { return false }
        return monitor.currentPath.status == .satisfied
    }
    
    // current network type like cellular, wi-fi or any other...
    var interfaceType: NWInterface.InterfaceType? {
        guard let _ = monitor else { return nil }
        return self.availableInterfacesTypes?.first
    }
    
    private var availableInterfacesTypes: [NWInterface.InterfaceType]? {
        guard let monitor = monitor else { return nil }
        return monitor.currentPath.availableInterfaces.map { $0.type }
    }
    
    private init() { }
    
    // call it first to start monitoring the network connection.
    func startMonitoring() {
        // if already monitoring, return it.
        if isMonitoring { return }
        
        monitor = NWPathMonitor()
        
        // running it on background thread, because we are continually monitoring the network.
        let queue = DispatchQueue(label: "Monitor")
        monitor?.start(queue: queue)
        monitor?.pathUpdateHandler = { path in
            var message = ""
            if path.status == .satisfied {
                if path.usesInterfaceType(NWInterface.InterfaceType.cellular) {
                    message = "Application connected via Cellular."
                } else if path.usesInterfaceType(NWInterface.InterfaceType.wifi) {
                    message = "Application connected via Wi-Fi"
                } else if path.usesInterfaceType(NWInterface.InterfaceType.wiredEthernet) {
                    message = "Application connected via WiredEthernet."
                } else if path.usesInterfaceType(NWInterface.InterfaceType.loopback) {
                    message = "Application connected via Local loopback networks."
                } else if path.usesInterfaceType(NWInterface.InterfaceType.other) {
                    message = "Application connected via Virtual networks or unknown types."
                }
                self.removeNoInternetNotification()
            } else {
                message = "Application not connected to the internet"
                self.addNoInternetNotification()
            }
            print(message)
        }
        isMonitoring = true
        didStartMonitoringHandler?()
    }
    
    // call it to stop the monitoring.
    func stopMonitoring() {
        if isMonitoring, let monitor = monitor {
            monitor.cancel()
            self.monitor = nil
            isMonitoring = false
            didStopMonitoringHandler?()
        }
    }
    
    deinit {
        stopMonitoring()
    }
    
    private func removeNoInternetNotification() {
        DispatchQueue.main.async{
            let sceneDelegate = UIApplication.shared.connectedScenes
                .first!.delegate as! SceneDelegate
            for subView in sceneDelegate.window?.subviews ?? [] {
                if subView.tag == 99 {
                    UIView.animate(withDuration: 1.0, delay: 0, options: .transitionCrossDissolve, animations: {
                        var frame  = subView.frame
                        frame.size.height = 0
                        subView.frame = frame
                    }, completion: { completed in
                        if completed {
                            subView.removeFromSuperview()
                        }
                    })
                    return
                }
            }
        }
    }
    
    private func addNoInternetNotification() {
        DispatchQueue.main.async{
            let sceneDelegate = UIApplication.shared.connectedScenes
                    .first!.delegate as! SceneDelegate
              
            for subView in sceneDelegate.window?.subviews ?? [] {
                if subView.tag == 99 {
                    return
                }
            }
            
            let window = UIApplication.shared.windows.first
            let topSafeArea = window?.safeAreaInsets.top ?? 0
            
            let noInternetView = UIView(frame: CGRectMake(0,
                                                          0,
                                                          (sceneDelegate.window?.frame.size.width ?? 0),
                                                          0))
            noInternetView.backgroundColor = .red
            noInternetView.tag = 99
            noInternetView.clipsToBounds = true
            sceneDelegate.window?.addSubview((noInternetView))
            
            let errorLbl = UILabel(frame: CGRectMake(0,
                                                     (topSafeArea),
                                                     (sceneDelegate.window?.frame.size.width ?? 0),
                                                     50))
            errorLbl.text = "No internet"
            errorLbl.textColor = .white
            errorLbl.textAlignment = .center
            noInternetView.addSubview(errorLbl)
            
            UIView.animate(withDuration: 1.0, delay: 0, options: .transitionCrossDissolve, animations: {
                var frame  = noInternetView.frame
                frame.size.height = (topSafeArea+50)
                noInternetView.frame = frame
            }, completion: nil)
        }
    }
}
