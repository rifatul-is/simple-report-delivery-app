//
//  ProfileView.swift
//  Delivery App
//
//  Created by Rifatul Islam on 2/6/23.
//

import SwiftUI

struct profile: Codable {
    let name: String
    let delivered: Int
    let canceled: Int
    let totalearned: Int
}

struct ProfileView: View {
    
    @State var profileData : profile = profile(name: "Amir Hamza", delivered: 1, canceled: 1, totalearned: 1)
    
    var body: some View {
            VStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .padding(.top)
                
                Text(profileData.name)
                    .font(.title)
                    .bold()
                
                Group {
                    HStack{
                        Text("Delivered Product")
                        
                        Spacer()
                        
                        Text(String(profileData.delivered))
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .frame(width: UIScreen.main.bounds.width - 40)
                    .cornerRadius(10)
                    
                    HStack{
                        Text("Cancelled Product")
                        
                        Spacer()
                        
                        Text(String(profileData.canceled))
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .frame(width: UIScreen.main.bounds.width - 40)
                    .cornerRadius(10)
                    
                    HStack{
                        Text("Total Income")
                        
                        Spacer()
                        
                        Text(String("$\(profileData.totalearned)"))
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .frame(width: UIScreen.main.bounds.width - 40)
                    .cornerRadius(10)
                
                }
                                
                Divider()
                    .padding()
                
                NavigationLink{
                    
                } label: {
                    
                    Text("Delivery History")
                        .padding(.all, 10)
                        .frame(width: UIScreen.main.bounds.width - 40, alignment: .center)
                        .bold()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .foregroundColor(.black)

                }
                
                Spacer()
            }
            .navigationTitle("Profile")
            .onAppear{
                getProfileData()
            }
    }
    
    private func getProfileData(){
        var request = URLRequest(url: URL(string: "http://report-delivery.mosnippet.xyz/profile.php")!,timeoutInterval: Double.infinity)
            request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if httpResponse.statusCode == 200 {
                print("Get profile data success")
            }
            
            guard let data = data else {
                print(String(describing: error))
                return
            }

            print(String(data: data, encoding: .utf8)!)
            
            do {
                self.profileData = try JSONDecoder().decode(profile.self, from: data)
                print("report decoded")
                print(self.profileData.name)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
