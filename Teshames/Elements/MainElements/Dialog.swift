//
//  Dialog.swift
//  Teshames
//
//  Created by sumaiya on 05/10/2566 BE.
//

import SwiftUI

struct Dialog: View {
   
  
    
  /*
    @State var timeRemaining = 900 // 15 minutes in seconds
       @State  var timerRunning = false
    //a timer value 
        var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    //current day at a list of number from 1 to 7
    
    var currentDay = Calendar.current.component(.weekday, from: Date())
    //the progress of the trim
    @State  var currentProgress: Double = 0.0
    //@State var trimValue: CGFloat = 0.0
    */
    
  
        @AppStorage("timeRemaining") var timeRemaining: Int = 900
        @AppStorage("timerRunning") var timerRunning: Bool = false
        @AppStorage("currentProgress") var currentProgress: Double = 0.0
        @AppStorage("currentDay") var currentDay: Int = Calendar.current.component(.weekday, from: Date())
        

    
    
    @State private var trimValues: [Int: CGFloat] = [:]

       
    //timer
  
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
  
    
    
    //to Bind
    var trimmedValueBinding: Binding<CGFloat> {
        Binding(get: {
            self.trimValues[currentDay] ?? 0.0
        }, set: { newValue in
            self.trimValues[currentDay] = newValue
        })
    }
    
    

 
   
    var body: some View{
        
        TopDialog(trimValue: trimmedValueBinding)

//                   Text("Trim Value for Day \(currentDay)☀️: \(trimValues[currentDay] ?? 0.0)")

        Text("Matching Days: \(countDaysWithMatchingTrim())")

        ZStack{
           
            Text(timeString(timeRemaining))
                       .font(.title)
                       .padding()
            
           
            //first circle
            Circle()
                .stroke(lineWidth: 24)
                .frame(width: 200,height: 200)
                .foregroundColor(.white)
                .shadow(color:.black.opacity(0.1),radius: 10,x:10,y:10)
            //second
            Circle()
                .stroke(lineWidth: 0.34)
                .frame(width: 175,height: 175)
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
            //circle prograss view
            Circle()

            
                .trim(from: 0.0, to: trimValues[Calendar.current.component(.weekday, from: Date())] ?? 0.0)
                             .stroke(style: StrokeStyle(lineWidth: 24, lineCap: .round))
                             .frame(width: 200, height: 200)
                             .rotationEffect(.degrees(-90))
                             .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.pinkColor,.yellowColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                             .onReceive(timer) { _ in
                                 withAnimation {
                                     if timerRunning && timeRemaining > 0 {
                                         timeRemaining -= 1
                                         let weekday = Calendar.current.component(.weekday, from: Date())
                                         trimValues[weekday] = 1.0 - CGFloat(timeRemaining) / 900.0
                                         
                                         
                        }
                    }
                   }
            
                            
        }
        .padding(.vertical, 24.0)
        
        
        HStack(spacing: 20) {
            
            Button(action: {
                pauseTimer()
        
              
                print("Pause tapped!")
                            }) {
                                Image(systemName: "pause.circle.fill")
                                    .font(.largeTitle)
                                    .padding()
                                    .frame(width: 60,height: 60)
                                    .background(Color.pinkColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(40)
                            }
                            
            Button(action: {
                                startTimer()
                NotificationManager.instance.schedualeNotification()
                print("Start tapped!")
                
                            }) {
                                Image(systemName: "play.circle.fill")
                                    .font(.largeTitle)
                                    .padding()
                                    .frame(width: 60,height: 60)
                                    .background(Color.pinkColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(40)
                            }
                           
            Button(action: {
                restartTimer()
              
                print("Restart tapped!")
               
                            }) {
                                Image(systemName: "gobackward")
                                    .font(.largeTitle)
                                    .padding()
                                    .frame(width: 60,height: 60)
                                    .background(Color.pinkColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(40)
                            }
            
            
            
                    
            
            
            
           
               }
  
        
        
        
      
    }
    private func startTimer() {
           timerRunning = true
       }
       
       private func pauseTimer() {
           timerRunning = false
       }
       
       private func restartTimer() {
           timerRunning = false
           timeRemaining = 900 // Reset to 15 minutes
       }
    private func timeString(_ time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
       
    
    private func countDaysWithMatchingTrim() -> Int {
        var matchingDays = 0
        let currentDay = Calendar.current.component(.weekday, from: Date())
        let currentTrimValue = trimValues[currentDay] ?? currentProgress
        
        for day in 1...6 { // Assuming 1 to 7 represents the days of the week
            if trimValues[day] == currentTrimValue {
                matchingDays += 1
            }
        }
        
        return matchingDays
    }
    
  
   
    
    
    
    
    
}

#Preview {
    Dialog()
}
