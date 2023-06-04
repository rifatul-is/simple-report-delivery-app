//
//  DeliveryCard.swift
//  Delivery App
//
//  Created by Rifatul Islam on 2/6/23.
//

import SwiftUI

struct DeliveryCard: View {
    
    @State var reportId : String
    @State var patientName : String
    @State var reportDate : String
    @State var reportText : String
    @State var doctorName : String
    @State var diagnosis : String
    @State var orderId : String
    @State var status : String

    var body: some View {
        NavigationLink{
            DeliveryDetails(reportId: self.reportId, reportDate: self.reportDate, status: self.status)
        }label: {
            VStack(alignment: .leading) {
                HStack{
                    ZStack{
                        if status == "Canceled" {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.red.opacity(0.8))
                                .font(.system(size: 40))
                        }
                        else if status == "Delivered" {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.green.opacity(0.8))
                                .font(.system(size: 40))
                        }
                        else {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.blue.opacity(0.8))
                                .font(.system(size: 40))
                        }

                        
                        Text(reportId)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 0){
                        Text(patientName)
                            .font(.title3)
                            .bold()
                            .foregroundColor(.black)
                        
                        Text("Order No : \(orderId)")
                            .foregroundColor(.black)
                            .font(.callout)
                        
                    }
                    .padding(.leading, 10)
                }
                
                Divider()
                
                Text(diagnosis)
                    .font(.callout)
                    .foregroundColor(.black)


                Text("Doctor : \(doctorName)")
                    .font(.callout)
                    .foregroundColor(.black)


            }
            .padding()
            .frame(maxWidth: UIScreen.main.bounds.width - 40, alignment: .leading)
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }

        
    }
}

struct DeliveryCard_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryCard(reportId: "1", patientName: "Patient Name", reportDate: "2023-05-05", reportText: "Report Text", doctorName: "Doctor Name", diagnosis: "Diagnosis Text Goes Here", orderId: "#1 2023-05-05", status: "Waiting For Delivery")
    }
}
