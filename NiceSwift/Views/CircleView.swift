//
//  ContentView.swift
//  NiceSwift
//
//  Created by zack on 2021/2/3.
//

import SwiftUI

struct CircleView: View {
    
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(image: ModelData().landmarks[0].image)
    }
}
