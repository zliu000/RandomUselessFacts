//
//  FactDisplay.swift
//  RandomUselessFacts
//
//  Created by Student on 5/7/26.
//

import SwiftUI

struct FactDisplay: View {
    var fact: String
    
    var body: some View {
        VStack(
            alignment: .center
        ){
            Text(fact)
                .font(.title)
                .lineSpacing(10)
                .foregroundStyle(
                    .orange
                )
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [
                Color(red: 0.631, green: 1, blue: 0.808), // #a1ffce
                Color(red: 0.98, green: 1, blue: 0.82) // #faffd1
                ]), startPoint: .top, endPoint: .bottom)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 15.0)
        )
        .shadow(color: .gray, radius: 3, x: 5, y: 5)
    }
}

