//
//  ProfileHost.swift
//  NiceSwift
//
//  Created by zack on 2021/2/5.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var editMode
    
    @EnvironmentObject var modeData: ModelData
    
    @State
    private var draftProfile: Profile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                
                if (editMode?.wrappedValue == .active) {
                    if #available(iOS 15.0, *) {
                        Button("Cancel", role: .cancel) {
                            draftProfile = modeData.profile
                            editMode?.animation().wrappedValue = .inactive
                        }
                    } else {
                        Button("Cancel", action: {
                            draftProfile = modeData.profile
                            editMode?.animation().wrappedValue = .inactive
                        })
                    }
                }
                
                Spacer()
                EditButton()
            }
            if (editMode?.wrappedValue == .inactive) {
                ProfileSummary(profile: modeData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modeData.profile
                    }
                    .onDisappear() {
                        modeData.profile = draftProfile
                    }
            }
        }.padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
