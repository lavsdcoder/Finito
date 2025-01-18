//
//  ButtonView.swift
//  Finito
//
//  Created by Rauls Lav on 17/01/25.
//

import SwiftUI

struct ButtonView: View {
    
    var buttonTitle : String
    var action: () -> Void
    
    var body: some View {
        Button (
            action : action
        ) { label: do {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.blue)
                Text(buttonTitle)
                    .bold()
                    .foregroundStyle(.white)
            }
        }
        }
    }
}

#Preview {
    ButtonView(buttonTitle: "Click Me",action: {})
}
