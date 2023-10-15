//
//  MainScreen.swift
//  Teshames
//
//  Created by sumaiya on 04/10/2566 BE.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationView {
            
            ScrollView {
                HeaderView().padding()
                //TopDialog(trimValue: .constant(0.5))
                    //.padding(.horizontal, 2.0).padding(.vertical,2.0)
                Dialog()
                Badgeview()
                
                   
            }.background(Color.background)
                .toolbar{
                    ToolbarItem{
                        NavigationLink(
                            
                            destination:
                                StreakScreen()
                            
                        ) {
                            Image(systemName: "target")
                                .foregroundColor(.pink)
                                .symbolRenderingMode(.palette)
                            
                            
                        }
                    }
                    
                }
            
            
        }.tint(.yellow)
        
    }
}

#Preview {
    MainScreen()
}
