//
//  SteakHeader.swift
//  Teshames
//
//  Created by sumaiya on 06/10/2566 BE.
//

import SwiftUI

struct SteakHeader: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 12) {
                HStack{
                    Text("01")
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    Text("☀️")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)

                }
                Text("Streak Days")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    
               // Text("No Streak yet")
                    //.foregroundColor(Color.black)
                    
            }
            //.padding(.bottom, 16)
            Spacer()
            Image("Sun")
                .resizable()
                .frame(width: 150, height: 150)
                .offset(x: 15.0, y: -30.0)
                .overlay(Image("Cloud").resizable().frame(width: 100, height: 90))
            


            
        }
    }
}

#Preview {
    SteakHeader()
}
