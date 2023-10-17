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
            
            Text("Badges") .font(.title2)
                .fontWeight(.medium)
                Spacer()
            
        }
        
        ZStack{
            HStack{
                ZStack{
                    Image("Badge 2")
                        .resizable()
                        .scaledToFit()
                        .padding(.trailing, 200)
                        
                    
                }
               
              
                
            }.frame(width: 350,height: 120)
                .background(Color.background)
                .cornerRadius(20)
                .padding(.bottom,2)
                .shadow(color:Color.costomGray, radius: 1,x: 4,y:3)
            
        }
        
    }
    }


#Preview {
    Achievement()
}
