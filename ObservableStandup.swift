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
    @Published var todaygoal = 0 // 오늘 목표량
    @Published var drink = 0 // 한잔의 양
    @Published var cycle = 0 // 일어나는 주기
    @Published var resttime = 0 // 쉬는 타이머
    
    @Published var todaygoal_array  =  Array(stride(from:1, through: 5,by:0.1))
    @Published var drink_array  =  Array(stride(from:100, through: 1000,by:10))
    @Published var cycle_array  =  Array(stride(from:10, through: 60,by:5))
    @Published var resttime_array  =  Array(stride(from:1, through: 20,by:1))
    @Published var standupcount = 0
//    @Published var isNavigationBarHidden: Bool = true
    
    @Published var testing = 0
    
    func todaydate()-> String{
        let date = Date()
        let todayMonth = Calendar.current.dateComponents([.month], from: date)
        let todayDay = Calendar.current.dateComponents([.day], from: date)
        let sum = String(todayMonth.month!)+"월"+String(todayDay.day!)+"일"
        return sum
    }

    
    func minus1(){
        if todaygoal==0{
            todaygoal = todaygoal_array.count-1
        }
        else{
            todaygoal-=1
        }
    }
    func plus1(){
        if todaygoal==todaygoal_array.count-1{
            todaygoal = 0
        }
        else{
            todaygoal+=1
        }
    }
    func minus2(){
        if drink==0{
            drink = drink_array.count-1
        }
        else{
            drink-=1
        }
    }
    func plus2(){
        if drink==drink_array.count-1{
            drink = 0
        }
        else{
            drink+=1
        }
    }
    func minus3(){
        if cycle==0{
            cycle = cycle_array.count-1
        }
        else{
            cycle-=1
        }
    }
    func plus3(){
        if cycle==cycle_array.count-1{
            cycle = 0
        }
        else{
            cycle+=1
        }
    }
    func minus4(){
        if resttime==0{
            resttime = resttime_array.count-1
        }
        else{
            resttime-=1
        }
    }
    func plus4(){
        if resttime==resttime_array.count-1{
            resttime = 0
        }
        else{
            resttime+=1
        }
    }
}

    
    
