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
        
//        ZStack{
//            HStack{
//                Text(client.currentFact.text)
//                    .font(.title3)
//                    .monospaced()
//                    .task{
//                        await client.getUselessFact(endpoint: .random)
//                        let factID = client.currentFact.id
//                        await client.getUselessFactDetails(factID: factID)
//                    }
//            }
//            .padding()
//            .background(Color.white)
//            .border(.black, width: 5)
//            .offset(y:-200)
//            let description = client.selectedFact.source_url
//            HStack{
//                Text(description)
//                    .font(.title3)
//                    .monospaced()
//            }
//            .padding()
//            .background(Color.white)
//            .border(.black, width: 5)
//            HStack{
//                Image(systemName: "heart.fill")    .resizable()
//                    .scaledToFit()
//                    .foregroundStyle(value ? .gray : .red)
//                    .frame(width: 70, height: 70)
//                    .animation(.bouncy(duration: 0.5, extraBounce: 2.0), value: scale)
//                    .onTapGesture {
//                        value.toggle()
//                        scale = 2.0
//                        
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                            scale = 1.0
//                        }
//                    }
//                    .animation(.bouncy(duration: 0.5), value: value)
//                 
//
//                Image(systemName: "xmark")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 60, height: 60)
//            }
//            .offset(y:200)
//
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.factSwipe)
    }
}

struct FactDisplay: View {
    var fact: String
    
    var body: some View {
        VStack(
            alignment: .center
        ){
            Text(fact)
                .font(.title3)
                .monospaced()
                
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
    FactDisplay(fact: "hauifhwui lorjeiwfhoiwajfowojafiheoifhoiw")
}
