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
                        
                        Text("\(String(format: "%.1f", standupObject.start1_array[standupObject.start1]))L")
                        
                            .font(.title)
                        
                        Button(action: {
                            waterObject.plus1()
                            
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
                            waterObject.minus2()
                        }){
                            Image(systemName: "minus.square.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
                        Text("\(waterObject.start2_array[waterObject.start2])ml")
                            .font(.title)
                        
                        Button(action: {
                            waterObject.plus2()
                            
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
                            waterObject.minus3()
                        }){
                            Image(systemName: "minus.square.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
                        Text("\(waterObject.start3_array[waterObject.start3])분")
                            .font(.title)
                        
                        Button(action: {
                            waterObject.plus3()
                            
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
                            waterObject.minus4()
                        }){
                            Image(systemName: "minus.square.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
                        Text("\(waterObject.start4_array[waterObject.start4])분")
                            .font(.title)
                        
                        Button(action: {
                            waterObject.plus4()
                            
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
                
            }
//            .navigationBarTitle("Hidden Title")
            .navigationBarHidden(true)
//                    .navigationBarTitle("")
//                    .navigationBarHidden(true)
        }
}
