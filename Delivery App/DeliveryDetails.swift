//
//  DeliveryDetails.swift
//  Delivery App
//
//  Created by Rifatul Islam on 2/6/23.
//

import SwiftUI

struct DeliveryDetailsList : Codable, Hashable {
    let report_id : String
    let patient_name : String
    let report_date : String
    let report_text : String
    let doctor_name : String
    let diagnosis : String
    let order_id : String
    let status : String
    
    let report_item_name : String
    let item_id : String
    let quantity : String
    let price : String
}

struct DeliveryDetails: View {
    
    @State var reportId : String
    @State var reportDate : String
    @State var status : String
    
    @State var detailsListing : [DeliveryDetailsList] = []
    
    @State var showAlert : Bool = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                VStack (alignment: .leading, spacing: 5){
                    HStack {
                        VStack (alignment: .leading) {
                            Text("ID: \(reportId)")
                                .bold()
                            
                            Text("Date : \(reportDate)")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                                .padding(.bottom, 10)
                            
                        }
                        
                        Spacer()
                        
                        VStack (alignment: .trailing) {
                            Text("Status")
                                .bold()
                            
                            Text(status)
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                                .padding(.bottom, 10)
                        }
                    }
                    
                }
                .frame(width: UIScreen.main.bounds.width - 40, alignment: .leading)
                .padding(.bottom)
                
                
                    ForEach(self.detailsListing, id: \.self) { i in
                        DeliveryDetailCard(reportId: i.report_id, patientName: i.patient_name, reportDate: i.report_date, reportText: i.report_text, doctorName: i.doctor_name, diagnosis: i.diagnosis, orderId: i.order_id, status: i.status, itemName: i.report_item_name, itemId: i.item_id, itemQuantity: i.quantity, itemPrice: i.price)
                    }
                
                Spacer()
                
                Divider()
                    .padding()
                
                Button{
                    showAlert.toggle()
                } label : {
                    Text("Deliver This Item")
                        .bold()
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 40, alignment: .center)
                        .background(Color(.systemGray6))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .padding(.bottom)
                .alert("Delivery This Item", isPresented: $showAlert) {
                    Button("Deliver Item", role: .cancel) {acceptDelivery(id: reportId)}
                    Button("Cancel", role: .destructive) {cancelDelivery(id: reportId)}
                }

            }
            .padding(.top, 15)
        }
        .navigationTitle("Delivery Details")
        .onAppear{
            getDetailList(id: reportId)
        }
    }
    
    func getDetailList(id : String) {
        var request = URLRequest(url: URL(string: "http://report-delivery.mosnippet.xyz/details.php?report_id=\(id)")!,timeoutInterval: Double.infinity)
            request.httpMethod = "POST"
        
        print(request)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if httpResponse.statusCode == 200 {
                print("delivery accepted")
            }
            
            guard let data = data else {
                print(String(describing: error))
                return
            }

            print(String(data: data, encoding: .utf8)!)
            
            do {
                self.detailsListing = try JSONDecoder().decode([DeliveryDetailsList].self, from: data)
                print("Data Decoded")
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func acceptDelivery(id : String) {
        var request = URLRequest(url: URL(string: "http://report-delivery.mosnippet.xyz/deliver.php?report_id=\(id)")!,timeoutInterval: Double.infinity)
            request.httpMethod = "POST"
        
        print(request)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if httpResponse.statusCode == 200 {
                print("delivery accepted")
            }
            
            guard let data = data else {
                print(String(describing: error))
                return
            }

            print(String(data: data, encoding: .utf8)!)
            
//            do {
//                let res = try JSONDecoder().decode(profile.self, from: data)
//                print(res.name)
//                print(res.canceled)
//            } catch let error {
//                print(error)
//            }
        }.resume()
    }
    
    func cancelDelivery(id : String) {
        var request = URLRequest(url: URL(string: "http://report-delivery.mosnippet.xyz/cancel.php?report_id=\(id)")!,timeoutInterval: Double.infinity)
            request.httpMethod = "POST"
        
        print(request)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if httpResponse.statusCode == 200 {
                print("delivery accepted")
            }
            
            guard let data = data else {
                print(String(describing: error))
                return
            }

            print(String(data: data, encoding: .utf8)!)
            
//            do {
//                let res = try JSONDecoder().decode(profile.self, from: data)
//                print(res.name)
//                print(res.canceled)
//            } catch let error {
//                print(error)
//            }
        }.resume()
    }
}

struct DeliveryDetails_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryDetails(reportId: "1", reportDate: "12-12-12", status: "Delivered")
    }
}
