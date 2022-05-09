//
//  Main.swift
//  stand-up
//
//  Created by Hyeongjung on 2022/05/08.
//

import SwiftUI

struct Main: View {
    @EnvironmentObject var standupObject : StandupObject
//    @Binding var currentDate : Date
    @State var currentwater = 0.0
    @State var today: Date = Date()
    @State private var showModal = false //상태
    
    @State var day = Date()

    @State var hasBeen = false
    
    
    
    //waterObject.start3_array[waterObject.start3] : 저장된 값
    //초기 시간
    @State var times = 0

    @State var timeRemaining = 0

    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func stopTimer() {
        self.timer.upstream.connect().cancel()
    }
    
    func startTimer() {
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
    @State var gostop = true
    
    func secondsToHoursMinutesSeconds () -> String {
        var min : String
        var sec : String
        if timeRemaining%60<10{
            sec = "0"
            sec += String(timeRemaining%60)
        }
        else{
            sec = String(timeRemaining%60)
        }
        if timeRemaining/60<10{
            min = "0"+String(timeRemaining/60)
        }
        else{
            min = String(timeRemaining/60)
        }
        let result = min+":"+sec
        return result
    }
    // 버튼 더 늘리게 하는 부분
    @State private var showImage = false
    var body: some View {
        VStack{
            VStack{
                Text("\(waterObject.todaydate())")
                Text("일어난 횟수 : \(waterObject.standupcount)")
            }
            .font(.title)
            .padding(.bottom,30)
            
            VStack{
                Text("남은 시간")// 남은시간이 0이되면 standuptimer로 가게 만든다.
                    .font(.title2)
                HStack{
                    Button(action: {
                        self.showImage.toggle()
                    }){
                        Text("\(secondsToHoursMinutesSeconds() )")
                            .font(.headline)
                            .onReceive(timer) { _ in
                                if self.timeRemaining > 0 {
                                    self.timeRemaining -= 1 }
                                if self.timeRemaining==0{
                                    self.showModal = true
                                }
                            }
                            .frame(width: 80, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                            )
                            .sheet(isPresented: self.$showModal) {
                                Standuptimer(timeRemaining : $timeRemaining)
                            }
                        if showImage{
                            Button(action: {
                                if gostop==true{
                                    stopTimer()
                                    gostop=false
                                    print(gostop)
                                }
                                else{
                                    startTimer()
                                    gostop = true
                                    print(gostop)
                                }
                            })
                            {
                                Image(systemName: "stop.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(Color.teal)
                            }
                            Button(action: {
                                //저장되어 있는 timeRemaining을 가져온다.
                                timeRemaining=waterObject.start3_array[waterObject.start3]*60
                            })
                            {
                                Image(systemName: "restart.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(Color.teal)
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(width: 320, height: 120)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.black, lineWidth: 3)
            )
            .padding(.bottom,10)
            

            
            
            
            
            VStack{
                Text("수분 섭취량") // picker사용할까 고민 중
                    .font(.title2)
                    .padding(.bottom,10)
                Text("\(String(format: "%.0f", currentwater)  )ml")
                //물 부분
                waterwave(currentwater: $currentwater)
            }
            .frame(width: 320, height: 350)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.black, lineWidth: 3)
            )
            
            .onAppear {
                if !self.hasBeen {
                    self.times =  waterObject.start3_array[waterObject.start3]*60 // 이건 필요없는 코드라 나중에 삭제
                    self.timeRemaining=waterObject.start3_array[waterObject.start3]*60//이것이 다른창갔다오면 정신을 못차린다. 왜 초기화?
                    self.timeRemaining=10//이것이 다른창갔다오면 정신을 못차린다. 왜 초기화?
                    self.hasBeen = true
                }
                //여기서 만약 testing의 값이 remaining과 다르면 test값을 넣는다.
            }
            
        }
//        .padding(.top, 1)
//        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarBackButtonHidden(true)
    }
    
}
