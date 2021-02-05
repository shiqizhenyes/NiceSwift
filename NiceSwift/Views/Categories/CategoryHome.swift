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
            .navigationTitle("Futured")
        }
    }
}

struct CategoryHome_Preivews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(ModelData())
    }
}
