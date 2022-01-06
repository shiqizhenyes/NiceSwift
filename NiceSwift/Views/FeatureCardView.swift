//
//  FeatureCardView.swift
//  NiceSwift
//
//  Created by Zack on 2021/12/29.
//

import SwiftUI

struct FeatureCardView: View {
    
    var landMark: Landmark
    
    var body: some View {
        if #available(iOS 15.0, *) {
            landMark.featureImage?.resizable()
                .aspectRatio(3 / 2, contentMode: .fit)
                .overlay {
                    TextOverLay(landMark: landMark)
                }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct TextOverLay: View {
    var landMark: Landmark
    
    var gradient: LinearGradient {
        .linearGradient(Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]), startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            gradient
            VStack(alignment: .leading) {
                Text(landMark.name)
                    .font(.title)
                    .bold()
                
                Text(landMark.park)
            }.padding()
        }.foregroundColor(.white)
    }
    
}


struct FeatureCardView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCardView(landMark: ModelData().features[0])
    }
}
