//
//  HistoryCard.swift
//  Delivery App
//
//  Created by Rifatul Islam on 2/6/23.
//

import SwiftUI

struct HistoryCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: "fork.knife.circle.fill")
                    .foregroundColor(.blue.opacity(0.8))
                    .font(.system(size: 46))
                
                
                VStack(alignment: .leading, spacing: 0){
                    Text("Takeout")
                        .font(.title3)
                        .bold()
                    
                    HStack(spacing: 5) {
                        Text("Order No :")
                        Text("23945")
                            .bold()
                    }
                    
                }
                .padding(.leading, 10)
                
                Spacer()
                
                Text("$10.15")
                    .font(.title3)
                    .bold()
                
            }
            
            
        }
        .padding()
        .frame(maxWidth: UIScreen.main.bounds.width - 40, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

struct HistoryCard_Previews: PreviewProvider {
    static var previews: some View {
        HistoryCard()
    }
}
