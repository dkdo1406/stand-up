//
//  Start.swift
//  stand-up
//
//  Created by Hyeongjung on 2022/05/08.
//

import SwiftUI

struct Start: View {
    @EnvironmentObject var standupObject : StandupObject
    
    @State private var selectedColor = 0
    var body: some View {
        
        NavigationView{
            VStack{
                Settingdata()
                
                //버튼 누르면 start()에서 메인페이지로 이동
                NavigationLink(destination: ContentView()
                    .navigationBarHidden(true))
                {
                    Text("시작")
                        .font(.title)
                        .frame(width: 130, height: 60)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }
            }

            .navigationBarTitle("")
            .navigationBarHidden(true)

        }
    }
}

