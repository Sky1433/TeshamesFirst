//
//  StreakScreen.swift
//  Teshames
//
//  Created by sumaiya on 05/10/2566 BE.
//

import SwiftUI

struct StreakScreen: View {
    var body: some View { 
        ScrollView{
            
            HStack(alignment: .top) {
            
            VStack(){
        
                SteakHeader()//.padding(.bottom,3)
                Achievement().padding(.vertical,5)
                Calender().frame(width: 350,height: 390)
               
            
            } .padding(.top, 40.0)
            
                .padding(.leading, 20.0)
            
                .padding(.trailing,20)
                .padding(.bottom, 5.0)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                           
                            Text("Streak").font(.headline)
                        }
                    }
                    
                }


        }
            
            
        }.padding(.horizontal, 2.0)
           
            
       
    }
}

#Preview {
    StreakScreen()
}
