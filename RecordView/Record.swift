//
//  Record.swift
//  stand-up
//
//  Created by Hyeongjung on 2022/05/08.
//

import SwiftUI

struct Record: View {
    @State var currentDate: Date = Date()
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 20){
                // Custom Date Picker....
                CustomDatePicker(currentDate :  $currentDate)
            }
            .padding(.vertical)
        }
        .padding(.top, 1)
        // Safe Area View...(밑에 추가버튼부분인데 난 사용안함
        /*
        .safeAreaInset(edge: .bottom){
            
            HStack{
                
                Button{
                    
                } label: {
                    Text("Add Task")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color(.orange),in: Capsule())
                }
                
                Button{
                    
                } label: {
                    Text("Add Remainder")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color(.purple),in: Capsule())
                }
            }
            .padding(.horizontal)
            .padding(.top,10)
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
        }
         */
    }
}
