//
//  Buttons.swift
//  Teshames
//
//  Created by sumaiya on 06/10/2566 BE.
//

import SwiftUI

struct Buttons: View {
    var imageName: String
        var action: () -> Void

        var body: some View {
            Button(action: {
                action()
            }) {
                Image(systemName: imageName)
                    .font(.system(size: 24))
                    .padding(20)
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .shadow(color: .white, radius: 10, x: 0, y: 5)
            }
        }
}

#Preview {
    Buttons(imageName: "pause.circle.fill") {
        
    }
}
