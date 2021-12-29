//
//  CategoryRow.swift
//  NiceSwift
//
//  Created by zack on 2021/2/5.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String
    var items: [Landmark]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName).font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink(
                            destination: LandmarkDetail(landmark: landmark)) {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }.frame(height: 185)
            
        }
        
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static let landmarks = ModelData().landmarks
    static var previews: some View {
        CategoryRow(categoryName: landmarks[0].category.rawValue,
                    items: Array(landmarks.prefix(4)))
    }
}
