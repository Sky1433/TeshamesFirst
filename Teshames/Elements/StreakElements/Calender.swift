//
//  Calender.swift
//  Teshames
//
//  Created by sumaiya on 06/10/2566 BE.
//

import SwiftUI

struct Calender: View {
    var body: some View {
        HStack{
            
            Text("Streak Calendar") .font(.title)
                .fontWeight(.medium)
           
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
        }.padding(.vertical, 7.0)
        
        MultiDatePicker(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Binding<Set<DateComponents>>@*/.constant([])/*@END_MENU_TOKEN@*/)

       
    }
        
    }


#Preview {
    Calender()
}
