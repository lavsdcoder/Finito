//
//  HeaderView.swift
//  Finito
//
//  Created by Rauls Lav on 17/01/25.
//

import SwiftUI

struct HeaderView: View {
    var title : String
    var subtitle : String
    var angle : Double
    var backgroungcolor : Color
    var textcolor : Color
    
    var body: some View {
        
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(backgroungcolor)
                    .rotationEffect(Angle(degrees: angle))
                 
                
                VStack{
                    Text(title)
                        .foregroundColor(textcolor)
                        .font(.system(size: 50))
                        .bold()
                    Text(subtitle)
                        .foregroundColor(textcolor)
                        .font(.system(size: 16))
                        .italic()
                }
                .padding(.top,80)
            }
           .frame(width: UIScreen.main.bounds.width * 3 , height: 350.0)
           .offset(y: -150)
        
        
       
    }
}

#Preview {
    HeaderView(
        title: "Finito",
        subtitle: "From to-do to ta-da :)",
        angle: 15,
        backgroungcolor: Color(red: 0.89, green: 0.64, blue: 0.70),
        textcolor: .black
    )
}
