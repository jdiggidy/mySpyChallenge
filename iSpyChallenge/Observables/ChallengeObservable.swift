//
//  ChallengeObservable.swift
//  iSpyChallenge
//
//  Created by Jeremy Barger on 10/29/22.
//

import Foundation

class ChallengeObservable: ObservableObject {
    
    @Published var challengeData: [Challenge] = []
    
    func fetchChallenges() {
        
    }
    
}
