//
//  NiceSwiftApp.swift
//  NiceSwift
//
//  Created by zack on 2021/2/3.
//

import SwiftUI

@main
struct NiceSwiftApp: App {
    
    @StateObject
    private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
