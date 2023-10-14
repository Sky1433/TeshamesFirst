//
//
//  Badgeview.swift
//  Teshames
//
//  Created by sumaiya on 06/10/2566 BE.
//

import SwiftUI

struct Badgeview: View {
    var body: some View {
        
            HStack{
                
                Text("Badges") .font(.title)
                    .fontWeight(.semibold)
                Text("1/03")
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                NavigationLink(destination: BadgesCollectionScreen()) {
                                   Text("Show more")
                                       .foregroundColor(.black)
                               }
                               .padding(.trailing)
                           }
                           .padding(.horizontal, 12.0)
                           .padding(.vertical, 7.0)
            
            HStack{
                Image("Badge 2")
                    .resizable()
                    .scaledToFit()
                Image("Badge 5")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.2)
                Image("Badge 6")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.2)
                    
                    
                
                
            }.frame(width: 350,height: 120)
                .background(Color.background)
                .cornerRadius(20)
                .padding(2)
                .shadow(radius: 8,x: 0,y:3)
            
            
        
       
    }
        
    }


#Preview {
    Badgeview()
}
