//
//  Achievement.swift
//  Teshames
//
//  Created by sumaiya on 06/10/2566 BE.
//

import SwiftUI

struct Achievement: View {
    var body: some View {
        HStack{
            
            Text("Achievement") .font(.title)
                .fontWeight(.medium)
                Spacer()
            Button(action: {
                       
                   }) {
                       Text("Show more")
                           .foregroundColor(.black)
                           .fontWeight(.regular)
                   }.padding(.trailing)
        }.padding(.horizontal, 12.0)
        
        ZStack{
            HStack{
                Text("No Badges").foregroundColor(.gray)
                    .fontWeight(.semibold)
                
            }.frame(width: 350,height: 120)
                .background(Color.background)
                .cornerRadius(20)
                .padding(.bottom,2)
                .shadow(radius: 1,x: 4,y:3)
            
        }
        
    }
    }


#Preview {
    Achievement()
}
