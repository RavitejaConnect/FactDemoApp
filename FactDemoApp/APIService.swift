//
//  APIService.swift
//  FactDemoApp
//
//  Created by RAVITEZ on 18/06/21.
//

import UIKit

class APIService: NSObject {
    
    private let sourcesURL = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")!
        func apiToGetFactData(completion : @escaping (Fact) -> ()){
            URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
                
                guard let data = data else { return }
                guard let string = String(data: data, encoding: String.Encoding.isoLatin1) else { return }
                guard let properData = string.data(using: .utf8, allowLossyConversion: true) else { return }
                do{
                let factData = try JSONDecoder().decode(Fact.self, from: properData)
                    completion(factData)
                } catch let error {
                print(error)
                }
                
                
                
                
//                if let data = data {
//
//                    let jsonDecoder = JSONDecoder()
//
//                    let factData = try! jsonDecoder.decode(Fact.self, from: data)
//                        completion(factData)
//                }
            }.resume()
        }

}
