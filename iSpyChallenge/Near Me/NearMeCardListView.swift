//
//  NearMeCardView.swift
//  iSpyChallenge
//
//  Created by Jeremy Barger on 10/28/22.
//

import SwiftUI

class NearMeHostingViewController: UIHostingController<NearMeCardListView> {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: NearMeCardListView())
    }
    
}

struct NearMeCardListView: View {
    
    @ObservedObject var observedChallenge = ChallengeObservable()
    
    var body: some View {
        VStack {
            List(observedChallenge.challengeData) { challenge in
                Section {
                    VStack {
                        HStack {
                            Text(challenge.id)
                        }
                        .foregroundColor(.secondary)
                        .font(.body)
                        Text(challenge.hint)
                            .foregroundColor(.primary)
                            .font(.title2)
                    }
                }
                
                
            }
        }
        .task {
            observedChallenge.fetchChallenges()
       }
    }
}

struct NearMeCardView_Previews: PreviewProvider {
    static var previews: some View {
        NearMeCardListView(observedChallenge: MockChallenge())
    }
}


