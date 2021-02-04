//
//  MapView.swift
//  NiceSwift
//
//  Created by zack on 2021/2/3.
//

import SwiftUI
import MapKit

struct MapVoew : View {
    
    var coordinate: CLLocationCoordinate2D
    
    @State
    private var region = MKCoordinateRegion()
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) -> MKCoordinateRegion {
        MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
    
    var body: some View {
        Map(coordinateRegion: self.$region)
    }
    
}

struct MapView_Previews: PreviewProvider {
 
    static var previews: some View {
        MapVoew(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}



