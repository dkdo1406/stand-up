//
//  ObservableStandup.swift
//  stand-up
//
//  Created by Hyeongjung on 2022/05/08.
//

import Foundation
import SwiftUI

final class StandupObject: ObservableObject{
    @EnvironmentObject var standupObject : StandupObject
    @Published var start1 = 0 // 오늘 목표량
    @Published var start2 = 0 // 한잔의 양
    @Published var start3 = 0 // 일어나는 주기
    @Published var start4 = 0 // 쉬는 타이머
    @Published var start1_array  =  Array(stride(from:1, through: 5,by:0.1))
    @Published var start2_array  =  Array(stride(from:100, through: 1000,by:10))
    @Published var start3_array  =  Array(stride(from:10, through: 60,by:5))
    @Published var start4_array  =  Array(stride(from:1, through: 20,by:1))
    @Published var standupcount = 0
//    @Published var isNavigationBarHidden: Bool = true
    
    @Published var testing = 0
    
    func todaydate()-> String{
        let date = Date()
        let todayMonth = Calendar.current.dateComponents([.month], from: date)
        let todayDay = Calendar.current.dateComponents([.day], from: date)
        var sum = String(todayMonth.month!)+"월"+String(todayDay.day!)+"일"
        return sum
    }

    
    func minus1(){
        if start1==0{
            start1 = start1_array.count-1
        }
        else{
            start1-=1
        }
    }
    func plus1(){
        if start1==start1_array.count-1{
            start1 = 0
        }
        else{
            start1+=1
        }
    }
    func minus2(){
        if start2==0{
            start2 = start2_array.count-1
        }
        else{
            start2-=1
        }
    }
    func plus2(){
        if start2==start2_array.count-1{
            start2 = 0
        }
        else{
            start2+=1
        }
    }
    func minus3(){
        if start3==0{
            start3 = start3_array.count-1
        }
        else{
            start3-=1
        }
    }
    func plus3(){
        if start3==start3_array.count-1{
            start3 = 0
        }
        else{
            start3+=1
        }
    }
    func minus4(){
        if start4==0{
            start4 = start4_array.count-1
        }
        else{
            start4-=1
        }
    }
    func plus4(){
        if start4==start4_array.count-1{
            start4 = 0
        }
        else{
            start4+=1
        }
    }
}

    
    
