//
//  Dialog.swift
//  Teshames
//
//  Created by sumaiya on 05/10/2566 BE.
//

import SwiftUI

struct Dialog: View {
    @State private var progress: Double = 0.0
    @State private var isTimerRunning = false
        @State private var shouldReset = false // Added state for resetting
       let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect() // Update every second
       let totalTime: TimeInterval = 900.0 // 15 minutes in seconds
    
   
    var body: some View{
        
       
       
        ZStack{
            Text("Time ")
           
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
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/,to:0.5)
                .stroke(style: StrokeStyle(lineWidth: 24,lineCap: .round))
                .frame(width: 200,height: 200)
                .rotationEffect(.degrees(-90))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.pink,.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .onReceive(timer) { _ in
                    withAnimation {
                        progress += 1.0 / totalTime
                        if progress >= 1.0 {
                            timer.upstream.connect().cancel() // Stop the timer when progress is complete
                        }
                    }
                    
                    
                    
                    
                }
           
        }
        .padding(.vertical, 24.0)
        
        
        HStack(spacing: 20) {
            Buttons(imageName: "pause.circle.fill") {
                       // Add your pause action here
                       print("Pause tapped!")
                   }
            Buttons(imageName: "play.circle.fill") {
                       // Add your start action here
                       print("Start tapped!")
                   }
            Buttons(imageName: "gobackward") {
                       // Add your restart action here
                       print("Restart tapped!")
                   }
               }
  
        
        
        
        
      
    }
    func formatTime(timeRemaining: TimeInterval) -> String {
        let minutes = Int(timeRemaining) / 60
        let seconds = Int(timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
    
}

#Preview {
    Dialog()
}
