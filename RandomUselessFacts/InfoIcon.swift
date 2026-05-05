//
//  InfoIcon.swift
//  RandomUselessFacts
//
//  Created by Student on 5/5/26.
//

import SwiftUI

struct InfoIcon: View {
    @State var toggled = false

    var body: some View {
        Image(systemName: "questionmark")
            .font(.title2)
            .fontWeight(.bold)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .fill(toggled ? Color.black : Color.white)
                    .stroke( .black, lineWidth: 3)
            )
            .foregroundStyle(toggled ? Color.white : Color.black)
            .onTapGesture {
                toggled = !toggled
            }
            .animation(.easeIn, value: toggled)
    }
}

#Preview {
    InfoIcon()
}
