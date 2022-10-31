//
//  Challenge.swift
//  iSpyChallenge
//
//

import Foundation

struct Challenge: Codable, Hashable, Identifiable {
    var id: String
    var hint: String
    var latitude: Double
    var longitude: Double
    var photoImageName: String
    var creatorID: String
    var matches: [Match] = []
    var ratings: [Rating] = []
}
