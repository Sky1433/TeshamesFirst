//
//  Dialog.swift
//  Teshames
//
//  Created by sumaiya on 05/10/2566 BE.
//

import SwiftUI

struct Dialog: View {
    
    @State private var timeRemaining = 900 // 15 minutes in seconds
       @State private var timerRunning = false
       private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var currentProgress: Double = 0.0
    @State private var trimValue: CGFloat = 0.0
    
    // Array to store progress for each day of the week
        @State private var dayProgress: [CGFloat] = Array(repeating: 0.0, count: 7)


   
    var body: some View{
        
       
       
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
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/,to:trimValue)
                .stroke(style: StrokeStyle(lineWidth: 24,lineCap: .round))
                .frame(width: 200,height: 200)
                .rotationEffect(.degrees(-90))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.customPink,.customYellow]), startPoint: .topLeading, endPoint: .bottomTrailing))

                .onReceive(timer) { _ in
                    withAnimation {
                        if timerRunning && timeRemaining > 0 {
                            timeRemaining -= 1
                            trimValue = 1.0 - CGFloat(timeRemaining) / 900.0
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
                                    .background(.customPink)
                                    .foregroundColor(.white)
                                    .cornerRadius(40)
                            }
                            
            Button(action: {
                                startTimer()
                print("Start tapped!")
                            }) {
                                Image(systemName: "play.circle.fill")
                                    .font(.largeTitle)
                                    .padding()
                                    .frame(width: 60,height: 60)
                                    .background(.customPink)
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
                                    .background(.customPink)
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
    
    
    
}

#Preview {
    Dialog()
}
