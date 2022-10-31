//
//  UserObservable.swift
//  iSpyChallenge
//
//  Created by Jeremy Barger on 10/30/22.
//

import Foundation

class UserObservable: ObservableObject {
    
    @Published var userData: [User] = []
    
    func fetchUsers() {
        
    }
    
}
