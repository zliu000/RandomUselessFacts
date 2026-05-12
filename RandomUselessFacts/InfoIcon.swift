//
//  InfoIcon.swift
//  RandomUselessFacts
//
//  Created by Student on 5/5/26.
//

import SwiftUI

struct InfoIcon: View {
    @Environment(AppModel.self) private var model: AppModel

    var body: some View {
        Image(systemName: "questionmark")
            .font(.title2)
            .fontWeight(.bold)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .fill(model.infoValue ? Color.black : Color.white)
                    .stroke( .black, lineWidth: 3)
            )
            .foregroundStyle(model.infoValue ? Color.white : Color.black)
            .onTapGesture {
                model.infoPressed()
            }
            .animation(.easeIn, value: model.infoValue)
    }
}

#Preview {
    InfoIcon()
        .environment(NetworkClient())
        .environment(AppModel())
}
