//
//  DeliveryDetailCard.swift
//  Delivery App
//
//  Created by Rifatul Islam on 3/6/23.
//

import SwiftUI

struct DeliveryDetailCard: View {
    
    @State var reportId : String
    @State var patientName : String
    @State var reportDate : String
    @State var reportText : String
    @State var doctorName : String
    @State var diagnosis : String
    @State var orderId : String
    @State var status : String
    
    @State var itemName : String
    @State var itemId : String
    @State var itemQuantity : String
    @State var itemPrice : String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack {
                VStack(alignment: .leading) {
                    Text("Doctor")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    
                    Text(doctorName)
                        .bold()
                }
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Patiene")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    
                    Text(patientName)
                        .bold()
                }
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Report Date")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    
                    Text(reportDate)
                        .bold()
                }
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Item Name")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    
                    Text(itemName)
                        .bold()
                }
            }
            .padding(.bottom, 10)
            
            VStack(alignment: .leading) {
                Text("Report")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                
                Text(reportText)
                    .bold()
                    .padding(.bottom, 10)
                
                Text("Diagnosis")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                
                Text(diagnosis)
                    .bold()
            }
            
            Divider()
                .padding(.vertical, 10)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("ID")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    
                    Text(itemId)
                        .bold()
                }
                
                Spacer()
                
                VStack(alignment: .center) {
                    Text("Quantity")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    
                    Text(itemQuantity)
                        .bold()
                }
                
                Spacer()

                VStack(alignment: .trailing) {
                    Text("Price")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    
                    Text(itemPrice)
                        .bold()
                }
            }

            
            

            
            
//            Text("Report Details")
//                .font(.system(size: 15))
//                .foregroundColor(.gray)
//
//            Text(reportText)
//                .bold()
//                .padding(.bottom, 10)
//
//            Text("Diagnosis Details")
//                .font(.system(size: 15))
//                .foregroundColor(.gray)
//
//            Text(diagnosis)
//                .bold()
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 40, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

struct DeliveryDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryDetailCard(reportId: "1", patientName: "1", reportDate: "1", reportText: "1", doctorName: "1", diagnosis: "1", orderId: "1", status: "1", itemName: "1", itemId: "1", itemQuantity: "1", itemPrice: "1")
    }
}
