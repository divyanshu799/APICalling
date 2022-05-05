//
//  API.swift
//  apiCalling
//
//  Created by Apple User on 19/04/22.
//

import Foundation
import UIKit




class APICall {
  
    
    var factArray: String?
    var myLength: Int?
    var completion: [()->Void] = []
    func makeAPICall(completion: @escaping(_ :Bool, _ sendFact: String, _ sendLength: Any)->Void) {
        guard let url = URL(string: "https://catfact.ninja/fact") else{
            return
        }
        print("Making API Call")
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
    request.timeoutInterval = 10
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
       // let body: [String: AnyHashable] = ["name":"divyanshu"]
        //request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
        let task = URLSession.shared.dataTask(with: request) { data, Response , error in
    
            if let data = data , error == nil
            {
            do
            {
                let response = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                if let temp = response as? [String: Any]{
                    self.factArray = temp["fact"] as? String ?? ""
                    self.myLength = temp["length"] as? Int ?? 0
                    completion(true,(self.factArray ?? ""),self.myLength)
                    //print(self.factArray!,self.myLength!)
                }
            
               // print("Success: \(response)")
                
            }
            catch {
                print(error)
            }
            }
        }
        task.resume()
    }
}
