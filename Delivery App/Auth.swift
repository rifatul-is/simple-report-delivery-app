//
//  Auth.swift
//  Delivery App
//
//  Created by Rifatul Islam on 2/6/23.
//

import SwiftUI
import Alamofire

struct Auth: View {
    @State public var authSuccess: Bool = false
    @State var isHidden: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                
                if !isHidden {
                    ProgressView("Loading")
                    
                }
                NavigationLink(destination: Home(), isActive: .constant(authSuccess)) {
                    Text("")
                }
            }
            .onAppear {
                createConnection()
            }
        }
    }
    
    private func createConnection(){
        var request = URLRequest(url: URL(string: "http://report-delivery.mosnippet.xyz/profile.php")!,timeoutInterval: Double.infinity)
            request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if httpResponse.statusCode == 200 {
                authSuccess.toggle()
                isHidden.toggle()
            }
            
            guard let data = data else {
                print(String(describing: error))
                return
            }

//            print(String(data: data, encoding: .utf8)!)
//            
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

struct Auth_Previews: PreviewProvider {
    static var previews: some View {
        Auth()
    }
}
