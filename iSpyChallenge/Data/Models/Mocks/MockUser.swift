//
//  MockUser.swift
//  iSpyChallenge
//
//  Created by Jeremy Barger on 10/28/22.
//

import Foundation

class MockUser: DataController {
    
    let fakeChallenges: [Challenge] = [
        Challenge(id: "chal0", hint: "it's easy", latitude: 37.7904462, longitude: -122.4011537, photoImageName: "photo_goes_here", creatorID: "234")
    ]
    
    override func getUsers() {
        allUsers = [
            User(id: "0", email: "email@email.com", username: "jdiggidy", challenges: fakeChallenges)
        ]
    }

}
