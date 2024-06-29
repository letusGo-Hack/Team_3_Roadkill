//
//  LocationManager.swift
//  Roadkill
//
//  Created by 김가람 on 6/29/24.
//

import SwiftUI
import CoreLocation

@Observable
final class LocationManager: NSObject {
    
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    var currentLocation: CLLocation?
    private var currentTask: Task<CLPlacemark, Error>?
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }

    // MARK: Methods
    func setupLocation() {
        // 위치 권한 요청
        locationManager.requestWhenInUseAuthorization()
    }
    
    // 위치 가져오기
    func requestLocation() {
        locationManager.requestLocation()
    }
    
    func lookUp(_ location: CLLocation) async throws -> CLPlacemark {
        
        currentTask = Task { [currentTask] in
            // Await any previous processing.
            _ = await currentTask?.result
            
            // Register a new task.
            let placemarks = try await geocoder.reverseGeocodeLocation(location)
            print(placemarks.first)
            return placemarks[0]
        }
        
        return try await currentTask!.value
    }
}

extension LocationManager: CLLocationManagerDelegate {
    // 위치 업데이트 시 호출되는 함수
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("현재 위치: \(location.coordinate.latitude), \(location.coordinate.longitude)")
            currentLocation = location
            Task {
                try await lookUp(location)
            }
        }
    }

    // 위치 업데이트 실패 시 호출되는 함수
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("위치 업데이트 실패: \(error.localizedDescription)")
    }
}
