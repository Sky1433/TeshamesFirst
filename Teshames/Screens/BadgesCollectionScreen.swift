//
//  BadgesCollectionScreen.swift
//  Teshames
//
//  Created by sumaiya on 06/10/2566 BE.
//

import SwiftUI

struct BadgesCollectionScreen: View {
    var body: some View {
        ScrollView{
            
            let months = ["Nov","Dec","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct ","Nov","Dec "]
            VStack{
                VStack{
                    HStack(alignment: .top ) {
                        VStack(alignment: .leading, spacing: 12 ) {
                            Text("Oct")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.leading)
                                .padding(.leading, 35.0)
                        }
                        
                        Spacer()
                        
                        
                    }.padding(.bottom,9)}
                VStack{
                    HStack(){
                        VStack{ Image("Badge 2")
                                .resizable()

                                .padding(/*@START_MENU_TOKEN@*/[.top, .leading]/*@END_MENU_TOKEN@*/)
                                .scaledToFit()
                            Text("1 Day")
                        }
                        VStack{ Image("Badge 5")
                                .resizable()
            
                                .padding(/*@START_MENU_TOKEN@*/[.top, .trailing]/*@END_MENU_TOKEN@*/)
                                .scaledToFit()
                                .opacity(0.3)
                            Text("1 Week")
                        }
                        
                        VStack{     Image("Badge 1")
                                .resizable()
                             
                                .padding([.top, .trailing])
                                .scaledToFit()
                                .opacity(0.3)
                            Text("1 Month")
                        }
                    }
                    Divider()
                    
                    ForEach (months, id: \.self){ month in
                        VStack{
                            VStack{
                                HStack(alignment: .top ) {
                                    VStack(alignment: .leading, spacing: 12 ) {
                                        Text(month)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color.black)
                                            .multilineTextAlignment(.leading)
                                            .padding(.leading)
                                    }
                                    
                                    Spacer()
                                    
                                    
                                }.padding(.bottom,9)
                                VStack{
                                    HStack(){
                                        VStack{ Image("Badge 2")
                                                .resizable()
                                                .scaledToFit()
                                                .opacity(0.3)
                                            Text("1 Day")
                                        }
                                        VStack{ Image("Badge 5")
                                                .resizable()
                                                .scaledToFit()
                                                .opacity(0.3)
                                            Text("1 Week")
                                        }
                                        
                                        VStack{     Image("Badge 1")
                                                .resizable()
                                                .scaledToFit()
                                                .opacity(0.3)
                                            Text("1 Month")
                                        }
                                    }
                                    Divider()
                                    
                                    //.orientation(.vertical)
                                    
                                }
                                
                            } .padding(25)
                            
                            if month == "Dec" {
                                Text("2024")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BadgesCollectionScreen()
}
