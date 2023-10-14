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
            VStack{
                VStack{
                    HStack(alignment: .top ) {
                        VStack(alignment: .leading, spacing: 12 ) {
                            Text("Oct  ")
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
                            Text("Welcome ")
                            Text("Welcome ")
                            Text("Welcome ")

                        }
                    }
                      
                    }.frame(width: 370,height: 120)
                        .background(Color.background)
                        .cornerRadius(20)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                HStack {
                                   
                                    Text("Badges").font(.headline)
                                }
                            }
                            
                        }
                     
                VStack{
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 12 ) {
                            Text("Oct ")
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
                            Text("Welcome ")
                            Text("Welcome ")
                            Text("Welcome ")

                        }
                    }
                      
                    }.frame(width: 370,height: 120)
                        .background(Color.background)
                        .cornerRadius(20)
                     
                
                
            }
            
            //2
            

                    
            }
            
        }
    }


#Preview {
    BadgesCollectionScreen()
}
