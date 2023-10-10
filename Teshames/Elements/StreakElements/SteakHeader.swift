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
                Text("0  ")
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                   
                Text("Steark Days  ")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    
                    
                Text("No Streak yet")
                    .foregroundColor(Color.black)
                    
            }
            Spacer()
            Text("🌥️").font(.system(size: 95))
            


            
        }
    }
}

#Preview {
    SteakHeader()
}
