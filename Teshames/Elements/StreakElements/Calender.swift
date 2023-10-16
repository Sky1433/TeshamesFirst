//
//  Calender.swift
//  Teshames
//
//  Created by sumaiya on 06/10/2566 BE.
//

import SwiftUI

struct Calender: View {
    @State var date = Date()
    @State private var dates: Set<DateComponents> = []
    
    var body: some View {
        NavigationStack{
            
            HStack{
                
                //Text("Streak Calendar") .font(.title)
                
                   // .fontWeight(.medium)
                
               
                
                
            }
            .navigationTitle("Streak Calendar")
           // .padding(.vertical, 7.0)
            MultiDatePicker("Dates Available", selection: $dates)
                .tint(.yellow)
                
        }//end of stack
       
        
            
        
        
        
       // DatePicker("Select a date", selection: $date)
        
    }

    }


#Preview {
    Calender()
}
