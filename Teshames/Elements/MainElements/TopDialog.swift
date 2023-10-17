//
//  TopDialog.swift
//  Teshames
//
//  Created by sumaiya on 06/10/2566 BE.
//

import SwiftUI


/* Todo
 
 - pass trim value for everday prograss(top dialog screen)
 - change the list of number in dialog screen to match the week day value
 " dialog screen from 1...7 , top dialog list of string of days "

*/
struct TopDialog: View {
   
       
       
    
    @State var timeRemaining = 900 // 15 minutes in seconds
    @State var timerRunning = false
    @State var currentProgress: Double = 0.0
    
    @Binding var trimValue: CGFloat
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let daysOfWeek = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    let currentDate = Date()
   
    
    
    
    var body: some View {
        
        HStack {
            ForEach(daysOfWeek.indices, id: \.self) { i in
                VStack {
                    ZStack {
                        
                        //first circle
                        Circle()
                            .stroke(lineWidth: 5)
                            .frame(width: 30,height: 30)
                            .foregroundColor(.white)
                            .shadow(color:.black.opacity(0.1),radius: 10,x:10,y:10)
                        //second
                        Circle()
                            .stroke(lineWidth: 0.34)
                            .frame(width: 23,height: 23)
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.3),.clear]), startPoint: .bottomLeading, endPoint: .topLeading))
                            .overlay{
                                Circle()
                                    .stroke(.black.opacity(0.1),lineWidth: 2)
                                    .blur(radius: 5)
                                    .mask{
                                        Circle()
                                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black,.clear]), startPoint: .bottomLeading, endPoint: .topLeading))
                                        
                                    }
                                
                            }
                        //prograss circle
                        Circle()
                            .trim(from: 0.0, to: (i == getCurrentDayIndex()) ? trimValue : 0.0)
                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round))
                            .frame(width: 30, height: 30)
                            .rotationEffect(.degrees(-90))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.custompink,.customyellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        
                    }
                    
                   
                    Text(daysOfWeek[i])
                        .fontWeight(.light)
                        .font(.caption)
                        .padding(.top, 3.0)
                    
//                    Text(getDateForDay(index: i))
//                        .font(.caption)
//                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 4.0)
        }
        .frame(width: 350, height: 100)
        .background(Color.background)
        .cornerRadius(20)
        .shadow(color: Color.costomGray, radius: 8, x: 0, y: 3)
    }
    //get the name of the day
    func getCurrentDayIndex() -> Int {
        let calendar = Calendar.current
        let currentDay = calendar.component(.weekday, from: Date()) // 1 for Sunday, 2 for Monday, etc.
        print((currentDay + 5) % 6 )
        return (currentDay + 5) % 6 // Adjust to start from Sunday (0-based index)
        
    }
    
    //get the date of today
    
    func getDateForDay(index: Int) -> String {
        let calendar = Calendar.current
        let startOfWeekDate = startOfWeek()
        let currentDateForDay = calendar.date(byAdding: .day, value: index, to: startOfWeekDate)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: currentDateForDay)
    }
    //get the current month and week
    func startOfWeek() -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: currentDate)
        print(currentDate)
        return calendar.date(from: components)!
        
    
    
   
    }
   
    
}

#Preview {
    TopDialog(trimValue: .constant(0.5) )
}
