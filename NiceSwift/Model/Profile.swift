//
//  Profile.swift
//  NiceSwift
//
//  Created by zack on 2021/2/5.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifacation: Bool = true
    var seasonalPhoto: Season = Season.winter
    var goalDate: Date = Date()
    
    // 注意` 不是 ‘
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autum = "🍂"
        case winter = "☃️"
        
        var id: String {
            self.rawValue
        }
        
    }
    
}
