//
//  SwiftUIView.swift
//  iSpyChallenge
//
//  Created by Jeremy Barger on 10/29/22.
//

// View
import SwiftUI

struct SwiftUIViewView: View {
    @StateObject private var oo = SwiftUIViewOO()
    
    var body: some View {
        VStack {
            List(oo.data) { datum in
                Text(datum.name)
            }
        }
        .task {
            oo.fetch()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewView()
    }
}

// Observable Object
import Combine
import SwiftUI

class SwiftUIViewOO: ObservableObject {
    @Published var data: [SwiftUIViewDO] = []
    
    func fetch() {
        data = [SwiftUIViewDO(name: "Datum 1"),
                SwiftUIViewDO(name: "Datum 2"),
                SwiftUIViewDO(name: "Datum 3")]
    }
}

// Data Object
import Foundation

struct SwiftUIViewDO: Identifiable {
    let id = UUID()
    var name: String
}
