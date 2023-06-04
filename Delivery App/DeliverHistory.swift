//
//  DeliverHistory.swift
//  Delivery App
//
//  Created by Rifatul Islam on 2/6/23.
//

import SwiftUI

struct DeliverHistory: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(1..<10){i in
                HistoryCard()
            }
        }
        .navigationTitle("Delivery History")
    }
}

struct DeliverHistory_Previews: PreviewProvider {
    static var previews: some View {
        DeliverHistory()
    }
}
