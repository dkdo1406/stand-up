//
//  Waterwave.swift
//  stand-up
//
//  Created by Hyeongjung on 2022/05/09.
//

import SwiftUI

struct Waterwave: View {
    @EnvironmentObject var standupObject : StandupObject
    @State var percent : Double = 0.0
    @Binding var currentwater : Double
        var body: some View {
            VStack {
                HStack{
                    Button(action: { // 0보다 작거나
                        if currentwater<=0{
                            currentwater=0
                            percent=0
                        }
                        else{ // 현재 마신양이
                            currentwater-=Double(standupObject.drink_array[standupObject.drink])
                            percent = ((Double)(currentwater*100)/(standupObject.todaygoal_array[standupObject.todaygoal]*1000))
                        }
                        
                    }){
                        Image(systemName: "minus.square.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.teal)
                    }
                    CircleWaveView(percent: Int(self.percent))
                    Button(action: { //전체보다 크다
                        //원래 100%가 끝이였으나 목표량보다 더 먹었다는 것을 보여주기 좋아보인다.
                        currentwater+=Double(standupObject.drink_array[standupObject.drink]) //ml로 들어갔다.
                        percent = ((Double)(currentwater*100)/(standupObject.todaygoal_array[standupObject.todaygoal]*1000))
                        

                    }){
                        Image(systemName: "plus.square.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.teal)
                    }
                }
            }
            .padding(.all)
        }
}

struct Wave: Shape {

    var offset: Angle
    var percent: Double
    
    var animatableData: Double {
        get { offset.degrees }
        set { offset = Angle(degrees: newValue) }
    }
    
    func path(in rect: CGRect) -> Path {
        var p = Path()

        // empirically determined values for wave to be seen
        // at 0 and 100 percent
        let lowfudge = 0.02
        let highfudge = 0.98
        
        let newpercent = lowfudge + (highfudge - lowfudge) * percent
        let waveHeight = 0.015 * rect.height
        let yoffset = CGFloat(1 - newpercent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360)
        
        p.move(to: CGPoint(x: 0, y: yoffset + waveHeight * CGFloat(sin(offset.radians))))
        
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            p.addLine(to: CGPoint(x: x, y: yoffset + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }
        
        p.addLine(to: CGPoint(x: rect.width, y: rect.height))
        p.addLine(to: CGPoint(x: 0, y: rect.height))
        p.closeSubpath()
        
        return p
    }
}

struct CircleWaveView: View {
    
    @State private var waveOffset = Angle(degrees: 0)
    let percent: Int
    
    var body: some View {

        GeometryReader { geo in
            ZStack {
                Text("\(self.percent)%")
                    .foregroundColor(.black)
                    .font(Font.system(size: 0.25 * min(geo.size.width, geo.size.height) ))
                Circle()
                    .stroke(Color.blue, lineWidth: 0.025 * min(geo.size.width, geo.size.height))
                    .overlay(
                        Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(percent)/100)
                            .fill(Color(red: 0, green: 0.5, blue: 0.75, opacity: 0.5))
                            .clipShape(Circle().scale(0.92))
                    )
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
            self.waveOffset = Angle(degrees: 360)
            }
        }
        .frame(width: 200, height: 200)
    }
}

struct waterwave_Previews: PreviewProvider {
    static var previews: some View {
        CircleWaveView(percent: 58)
    }
}
