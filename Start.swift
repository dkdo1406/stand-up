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
                Text("쫌 일라라")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom,20)
                    
                VStack{
                    Text("오늘 목표량") // picker사용할까 고민 중
                        .font(.title)
                    //이놈!!!
                    HStack{
                        Button(action: {
                            standupObject.minus1()
                        }){
                            Image(systemName: "minus.square.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
                        Text("\(String(format: "%.1f", standupObject.todaygoal_array[standupObject.todaygoal]))L")
                        
                            .font(.title)
                        
                        Button(action: {
                            standupObject.plus1()
                            
                        }){
                            Image(systemName: "plus.square.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                    }
                    //버튼 끝
                }
                .frame(width: 320, height: 120)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 2)
                )
                .padding(.bottom,5)
                
                VStack{
                    Text("한번에 마실 양") // picker사용할까 고민 중
                        .font(.title)
                    //이놈!!!
                    HStack{
                        Button(action: {
                            standupObject.minus2()
                        }){
                            Image(systemName: "minus.square.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
                        Text("\(standupObject.drink_array[standupObject.drink])ml")
                            .font(.title)
                        
                        Button(action: {
                            standupObject.plus2()
                            
                        }){
                            Image(systemName: "plus.square.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                    }
                    //버튼 끝
                }
                .frame(width: 320, height: 120)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 2)
                )
                .padding(.bottom,5)
                
                VStack{
                    Text("일어나는 주기") // picker사용할까 고민 중
                        .font(.title)
                    //이놈!!!
                    HStack{
                        Button(action: {
                            standupObject.minus3()
                        }){
                            Image(systemName: "minus.square.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
                        Text("\(standupObject.cycle_array[standupObject.cycle])분")
                            .font(.title)
                        
                        Button(action: {
                            standupObject.plus3()
                            
                        }){
                            Image(systemName: "plus.square.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                    }
                    //버튼 끝
                }
                .frame(width: 320, height: 120)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 2)
                )
                .padding(.bottom,5)
                
                VStack{
                    Text("쉬는시간") // picker사용할까 고민 중
                        .font(.title)
                    //이놈!!!
                    HStack{
                        Button(action: {
                            standupObject.minus4()
                        }){
                            Image(systemName: "minus.square.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
                        Text("\(standupObject.resttime_array[standupObject.resttime])분")
                            .font(.title)
                        
                        Button(action: {
                            standupObject.plus4()
                            
                        }){
                            Image(systemName: "plus.square.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                    }
                    //버튼 끝
                }
                .frame(width: 320, height: 120)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 2)
                )
                .padding(.bottom,20)
                
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

