//
//  ProfileEditor.swift
//  NiceSwift
//
//  Created by Zack on 2021/12/24.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        
        let max = Calendar.current.date(byAdding: .year, value: +1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username:").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            Toggle (isOn: $profile.prefersNotifacation) {
                Text("Enable Notification").bold()
            }
            VStack (alignment: .center, spacing: 20) {
                Text("Seasonal Photo").bold()
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }.pickerStyle(.segmented)
                DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date ) {
                    Text("Goal date").bold()
                }
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
