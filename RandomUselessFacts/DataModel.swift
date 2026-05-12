//
//  UselessFact.swift
//  RandomUselessFacts
//
//  Created by Student on 4/27/26.
//

import SwiftUI

struct UselessFact: Codable, Identifiable {
    var id: String
    var text: String
}

struct UselessFactDetail: Codable {
    var source: String
    var source_url: String
}
