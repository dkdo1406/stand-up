//
//  stand_upApp.swift
//  stand-up
//
//  Created by Hyeongjung on 2022/05/08.
//

import SwiftUI

@main
struct stand_upApp: App {
    @StateObject private var standupObject = StandupObject()
    
    var body: some Scene {
        WindowGroup {
            Start()
                .environmentObject(standupObject)
        }
    }
}
