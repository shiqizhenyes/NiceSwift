//
//  ContentView.swift
//  NiceSwift
//
//  Created by zack on 2021/2/3.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapVoew().frame(height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            CircleView().offset(y: -130).padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }.font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                
                Text("About Turtle Roc")
                    .font(.title2)
                Text("Descriptive text goes here.")
                
            }.padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
