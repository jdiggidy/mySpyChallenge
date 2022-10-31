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
    
    
    
    var body: some View {
        List {
            HStack {
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
            }
            .foregroundColor(.secondary)
            .font(.body)
            
            Text("Multiline text")
                .font(.title2)
            
            
        }
        
    }
}

struct NearMeCardView_Previews: PreviewProvider {
    static var previews: some View {
        NearMeCardListView()
    }
}
