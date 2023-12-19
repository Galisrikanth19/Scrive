//
//  NetworkMonitoring.swift
//  Created by Srikanth on 01/01/23

import Network

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
            } else {
                message = "Application not connected to the internet"
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
}
