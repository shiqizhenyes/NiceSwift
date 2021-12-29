//
//  ProfileSummary.swift
//  NiceSwift
//
//  Created by zack on 2021/2/5.
//

import SwiftUI

struct ProfileSummary: View {
    
    @EnvironmentObject
    var modelData: ModelData
    
    var profile: Profile
    
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Notifacations: \(profile.prefersNotifacation ? "on" : "Off" )")
                Text("Seasonal photo: \(profile.seasonalPhoto.rawValue)")
                Text("Goal date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Complete Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(/*@START_MENU_TOKEN@*/Angle(degrees: 90)/*@END_MENU_TOKEN@*/)
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(/*@START_MENU_TOKEN@*/0.50/*@END_MENU_TOKEN@*/)
                                .hueRotation(Angle(degrees: 45))
                            
                        }.padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    HikeView(hike: modelData.hikes[0])
                }
                
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
