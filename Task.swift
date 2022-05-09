//
//  Task.swift
//  stand-up
//
//  Created by Hyeongjung on 2022/05/09.
//

import SwiftUI

// Task Model and Sample Tasks...
// Array of Tasks...
struct Task: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

// Total Task Meta View...
struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

// samplre Date for Testing...
// 여기서는 offset을 기준으로 알림날짜를 선택한다
// 나는 처음부터 날짜를 저장하여 경고횟수를 띄우고 싶다.
func getSampleDate(offset: Int)->Date{
    
    let calender = Calendar.current
    
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

func getSampleDate(dateString:String)->Date{
    
    let dateFormatter = DateFormatter()

    dateFormatter.dateFormat = "yyyy-MM-dd"
    dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?

    let date:Date = dateFormatter.date(from: dateString)!
    
    return date ?? Date() //빈값이 안오면 왼쪽 빈값이 오면 default 데이터인 오른쪽을 보낸다.
}


// Sample Tasks...
var tasks: [TaskMetaData] = [ //%.2f

    TaskMetaData(task:[
        Task(title: "마신물 : 1500ml"), // 마신 물의 양
        Task(title: "일어난 횟수: 8회"), // 일어난 횟수는 변수에서 가져온다.
    ], taskDate: getSampleDate(dateString: "2022-05-03")),
    
    TaskMetaData(task:[
        Task(title: "마신물 : 2000ml"), // 마신 물의 양, 경고받은 횟수,
        Task(title: "일어난 횟수: 15회"), // 마신 물의 양, 경고받은 횟수,
    ], taskDate: getSampleDate(dateString: "2022-05-04")),
    
    
//    TaskMetaData(task:[
//
//        Task(title: "Talk to Jenna Ezarik")
//    ], taskDate: getSampleDate(offset: -3)),
//    TaskMetaData(task:[
//
//        Task(title: "meeting TIm cook")
//    ], taskDate: getSampleDate(offset: -8)),
//    TaskMetaData(task:[
//
//        Task(title: "meet jun")
//    ], taskDate: getSampleDate(offset: 10)),
//    TaskMetaData(task:[
//
//        Task(title: "meeting")
//    ], taskDate: getSampleDate(offset: -22)),
//    TaskMetaData(task:[
//
//        Task(title: "Nothing")
//    ], taskDate: getSampleDate(offset: 15)),
//    TaskMetaData(task:[
//
//        Task(title: "meet bedger")
//    ], taskDate: getSampleDate(offset: -20)),
]
