//
//  NetworkClient.swift
//  RandomUselessFacts
//
//  Created by Student on 4/27/26.
//

import SwiftUI

enum FactAPIType {
    case daily
    case random
}


@Observable
class NetworkClient {
    
    // Temporarily boolean for languages
    /** True = en, (default); False = de **/
    private var language: Bool = true
    
    private var fact: UselessFact
    
    func getUselessFact(endpoint: FactAPIType) async {
        var urlStr: String = ""
        
        switch endpoint {
        case .daily: urlStr = "https://uselessfacts.jsph.pl/api/v2/facts/today?language=\(language ? "en" : "de")"
        case .random: urlStr = "https://uselessfacts.jsph.pl/api/v2/facts/random?language=\(language ? "en" : "de")"
        }
        
        let url: URL? = URL(string: urlStr)
        
        guard let urlUnwrapped = url else {
            return
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: urlUnwrapped)
            
            
        }
    }
}
