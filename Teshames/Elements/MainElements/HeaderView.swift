//
//  HeaderView.swift
//  Teshames
//
//  Created by sumaiya on 04/10/2566 BE.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
           HStack(alignment: .top) {
               VStack(alignment: .leading, spacing: 12) {
                   Text("Rise and shine!  ")
                       .font(.title)
                       .fontWeight(.semibold)
                       .foregroundColor(Color.black)
                       .multilineTextAlignment(.leading)
                       
                   Text("Welcome to a brand new day.")
                       .foregroundColor(Color.black)
               }

               Spacer()


           }
           
       }
}

#Preview {
    HeaderView()
}
