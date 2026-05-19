//
//  InfoIcon.swift
//  RandomUselessFacts
//
//  Created by Student on 5/5/26.
//

import SwiftUI

struct ToFavoritesIcon: View {
    @Environment(AppModel.self) private var model: AppModel
    @State private var showDetailView = false

    var body: some View {
        Image(systemName: "star.square.on.square")
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
                withAnimation(.bouncy(duration: 0.5)) {
                    model.infoPressed()
                } completion: {
                    model.resetAndRefresh()
                }
                model.infoPressed()
                showDetailView = true
            }
            .symbolEffect(.bounce, value: model.infoValue)
            .animation(.easeIn, value: model.infoValue)
            .navigationDestination(isPresented: $showDetailView){
                FavoritesView()
                    .environment(model)
            }
    }
}

#Preview {
    ToFavoritesIcon()
        .environment(NetworkClient())
        .environment(AppModel())
}
