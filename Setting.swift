//
//  Setting.swift
//  stand-up
//
//  Created by Hyeongjung on 2022/05/08.
//

import SwiftUI

struct Setting: View {
    @EnvironmentObject var standupObject : StandupObject
    
    @State private var selectedColor = 0
    var body: some View {
        VStack{
            Settingdata()
        }
        
    
        }
}
