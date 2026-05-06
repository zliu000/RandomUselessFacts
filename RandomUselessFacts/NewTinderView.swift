//
//  NewTinderView.swift
//  RandomUselessFacts
//
//  Created by Student on 5/1/26.
//

import SwiftUI

struct NewTinderView: View {
    // @State private var client = NetworkClient()
    @Environment(NetworkClient.self) private var client
    @Environment(AppModel.self) private var model
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                FactDisplay(fact: client.currentFact.text)
                    .task{
                        await client.getUselessFact(endpoint: .random)
                    }
                
                Spacer()
                
                if model.infoValue {
                    DetailDisplay(
                        source: client.selectedFact.source,
                        source_url: client.selectedFact.source_url
                    )
                }
                
                HStack(
                    alignment: .center,
                    spacing: 35
                ){
                    HeartIcon()
                    InfoIcon()
                    XIcon()
                }
                .padding()
                .onChange(of: model.heartValue) {
                    Task {
                        await client.getUselessFact(endpoint: .random)
                    }
                }
            }
            .padding()
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

struct DetailDisplay: View {
    var source: String
    var source_url: String
    
    var body: some View {
        VStack{
            Text(source)
            Text(source_url)
        }
    }
}


#Preview {
    NewTinderView()
        .environment(NetworkClient())
        .environment(AppModel())
}
