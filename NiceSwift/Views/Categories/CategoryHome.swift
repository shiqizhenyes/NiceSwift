//
//  CategoryHome.swift
//  NiceSwift
//
//  Created by zack on 2021/2/5.
//

import Foundation
import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject
    var modelData: ModelData
    
    @State private var showProfile = false
    
    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.landmarks)
                }.listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Futured")
            .toolbar {
                Button {
                    showProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showProfile) {
                ProfileHost().environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Preivews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(ModelData())
    }
}
