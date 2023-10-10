//
//  TopDialog.swift
//  Teshames
//
//  Created by sumaiya on 06/10/2566 BE.
//

import SwiftUI

struct TopDialog: View {
    @State private var timeRemaining = 900 // 15 minutes in seconds
       @State private var timerRunning = false
       private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var currentProgress: Double = 0.0
    @State private var trimValue: CGFloat = 0.0
    
    // Array to store progress for each day of the week
        @State private var dayProgress: [CGFloat] = Array(repeating: 0.0, count: 7)
    
    var body: some View {
        HStack{
            
            VStack{
                
                ZStack{
                    
                    
                    //first circle
                    Circle()
                        .stroke(lineWidth: 10)
                        .frame(width: 40,height: 40)
                        .foregroundColor(.white)
                        .shadow(color:.black.opacity(0.1),radius: 10,x:10,y:10)
                    //second
                    Circle()
                        .stroke(lineWidth: 0.34)
                        .frame(width: 30,height: 30)
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
                        .stroke(style: StrokeStyle(lineWidth: 10,lineCap: .round))
                        .frame(width: 30,height: 30)
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
                    
                    
                   
                    
                    
                }.frame(width: 350,height: 70)
                    .background(Color.background)
                    .cornerRadius(20)
                    .padding(8)
                    .shadow(radius: 8,x: 0,y:3)
                
                
                
               
                
             
                
            }
            
           
            
            
        }
    }
}

#Preview {
    TopDialog()
}
