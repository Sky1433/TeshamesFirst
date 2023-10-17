//
//  ContentView.swift
//  Teshames
//
//  Created by sumaiya on 04/10/2566 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                Text("Rise and shine!  ")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                HStack{
                    Text("Welcome to a brand new day.")
                        .foregroundColor(Color.black)

                    Button("☀️"){
                        UIApplication.shared.inAppNotification(adaptForDynamicIsland: false, timeout: 5, swipeToClose: true){
                            HStack{
                                Image("pic")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipShape(.circle)
                                
                                VStack(alignment: .leading, spacing: 6, content: {
                                    Text("تــشـمّـس 🌤️")
                                        .font(.callout.bold())
                                        .foregroundStyle(.black)
                                    
                                    Text("Make sure if you are under the SUN?")
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                })
                                .padding(.top, 5)
                                
                                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                                
                            }
                        }
                    }
                    Spacer()
                }
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
