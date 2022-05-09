//
//  Standuptimer.swift
//  stand-up
//
//  Created by Hyeongjung on 2022/05/08.
//

import SwiftUI

struct Standuptimer: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var standupObject : StandupObject
    @State var resttimeRemaining = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeup = false
    @Binding var timeRemaining : Int

    func secondsToHoursMinutesSeconds () -> String {
        var min : String
        var sec : String
        if resttimeRemaining%60<10{
            sec = "0"
            sec += String(resttimeRemaining%60)
        }
        else{
            sec = String(resttimeRemaining%60)
        }
        if resttimeRemaining/60<10{
            min = "0"+String(resttimeRemaining/60)
        }
        else{
            min = String(resttimeRemaining/60)
        }
        let result = min+":"+sec
        return result
    }
    
    var body: some View {
        VStack{
            Text("자리에서 일어나 스트레칭하세요!")
                .font(.title)
                .padding(.bottom,30)
            
            HStack{
                Text("\(secondsToHoursMinutesSeconds() )")
                    .font(.title)
                    .onReceive(timer) { _ in
                        if self.resttimeRemaining > 0 { self.resttimeRemaining -= 1 }
                    }
                    .frame(width: 150, height: 80)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 3)
                    )
                Button(action: {
                    if resttimeRemaining==0{
                        timeup=true
                        standupObject.standupcount+=1
                    }
                    if timeup{
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    self.timeRemaining = 10
                    
                }){
                    Image(systemName: "play.square.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                }
            }
        }
        .onAppear {
//            self.times =  waterObject.start4_array[waterObject.start4]*60
            self.resttimeRemaining=standupObject.resttime_array[standupObject.resttime]*60
            self.resttimeRemaining = 10
        }
        .onDisappear {
            
        }
    }
}


