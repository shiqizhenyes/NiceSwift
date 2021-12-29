//
//  LandmarkDetail.swift
//  NiceSwift
//
//  Created by zack on 2021/2/3.
//

import Foundation
import SwiftUI

struct LandmarkDetail: View {
    
    var landmark: Landmark
    
    var body: some View {
        
        ScrollView {
            
            MapVoew(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            CircleView(image: landmark.image).offset(y: -130).padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .foregroundColor(.primary)
            
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }.font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
                
            }.padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
        
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
