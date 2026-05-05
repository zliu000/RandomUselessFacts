//
//  NewTinderView.swift
//  RandomUselessFacts
//
//  Created by Student on 5/1/26.
//

import SwiftUI

struct NewTinderView: View {
    @State private var client = NetworkClient()
    @State private var value = true
    @State private var scale = 1.0
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                FactDisplay(fact: client.currentFact.text)
                    .task{
                        await client.getUselessFact(endpoint: .random)
                    }
                
                Spacer()
                
                HStack(
                    alignment: .center,
                    spacing: 35
                ){
                    HeartIcon()
                    InfoButton()
                    XIcon()
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.factSwipe)
    }
}

struct FactDisplay: View {
    var fact: String
    
    var body: some View {
        VStack(
            alignment: .center
        ){
            Text(fact)
                .font(.title)
                .lineSpacing(10)
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [.cyan, .mint, .white, .white]), startPoint: .top, endPoint: .bottom)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 15.0)
        )
        .shadow(color: .gray, radius: 3, x: 5, y: 5)
    }
}


#Preview {
    NewTinderView()
        .environment(NetworkClient())
        .environment(AppModel())
}
