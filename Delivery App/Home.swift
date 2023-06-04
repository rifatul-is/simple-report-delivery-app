//
//  ContentView.swift
//  Delivery App
//
//  Created by Rifatul Islam on 2/6/23.
//

struct reportList : Codable, Hashable {
    let report_id : String
    let patient_name : String
    let report_date : String
    let report_text : String
    let doctor_name : String
    let diagnosis : String
    let order_id : String
    let status : String
}
import SwiftUI

struct Home: View {
    @State var reportListing : [reportList] = []
    var body: some View {
        ScrollView(showsIndicators: false){
            HStack (alignment: .center){
                Text("Delivery List")
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
                
                NavigationLink{
                    ProfileView()
                } label: {
                    Image(systemName: "person.crop.circle")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }

            }
            .padding(.top)
            .padding(.horizontal)
            
            VStack {
                ForEach(reportListing, id: \.self) {i in
                    DeliveryCard(reportId: i.report_id, patientName: i.patient_name, reportDate: i.report_date, reportText: i.report_text, doctorName: i.doctor_name, diagnosis: i.diagnosis, orderId: i.order_id, status: i.status)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            getReportList()
        }
    }
    
    private func getReportList(){
        
        var request = URLRequest(url: URL(string: "http://report-delivery.mosnippet.xyz/reports.php")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if httpResponse.statusCode == 200 {
                print("Success")
            }
            
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            //print(String(data: data, encoding: .utf8)!)
            
            do {
                self.reportListing = try JSONDecoder().decode([reportList].self, from: data)
                print("report decoded")
                print(self.reportListing)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
