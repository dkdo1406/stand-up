//
//  ContentView.swift
//  stand-up
//
//  Created by Hyeongjung on 2022/05/08.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var standupObject : StandupObject
    
    var body: some View {
        TabView {
            Main()
            .tabItem{
                Image(systemName: "house")
                Text("홈")
            }
            Record()
            .tabItem{
                Image(systemName: "calendar")
                Text("기록")
            }
            
            Setting()
            .tabItem{
                Image(systemName: "gear")
                Text("설정")
            }
        }
        .padding(.top, 1)
//        .navigationBarTitle("Visible Title 1")
        
        .navigationBarTitle("", displayMode: .automatic)
//        .navigationBarHidden(true)
                
    }
}
