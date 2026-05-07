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
                .onChange(of: model.xValue) {
                    Task {
                        await client.getUselessFact(endpoint: .random)
                    }
                }
                .onChange(of: model.heartValue){
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
