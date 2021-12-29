//
//  CategoryView.swift
//  NiceSwift
//
//  Created by zack on 2021/2/5.
//

import SwiftUI

struct CategoryItem: View {
    
    var landmark: Landmark
    
    var body: some View {

        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(5.0)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }.padding(.leading, 15)

    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
