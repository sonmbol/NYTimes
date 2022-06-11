//
//  NetworkManager.swift
//  app
//
//  Created by ahmed abdalla on 10/06/2022.
//  Copyright © 2022 Ahmed Abdalla. All rights reserved.
//

import Foundation

class NetworkManager {
    
    enum method : String {
        case get = "GET"
        case post = "POST"
        case put    = "PUT"
        case patch  = "PATCH"
        case delete = "DELETE"
    }
    
    enum NetworkError: Error {
        case badURL
        case decodingError
        case badRequest
        case noData
        case backendError
        case cusom(Error)
    }
    
    class func APICall<T:Codable>(endUrl: String,input: [String: String], method: method, headers: [String: String]?, type: T.Type , completion: @escaping(Result<(T,URLResponse?),NetworkError>) -> Void){
        var urlString = Environment.baseURL + endUrl
        if method == .get {
            urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            if input != [:] {
                for (index, item) in input.enumerated() {
                    if index == 0 {
                        urlString.append("?" + item.key + "=" + item.value)
                    } else {
                        urlString.append("&" + item.key + "=" + item.value)
                    }
                }
            }
        }
        
        guard let url = URL(string: urlString) else{
            completion(.failure(.badURL))
            return
        }
        var urlRequest = URLRequest(url: url)
        
        
        //        if let headerFields = headers {
        //            for (_, item) in headerFields.enumerated() {
        //                urlRequest.setValue(item.value, forHTTPHeaderField: item.key)
        //            }
        //        }
        
        urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpMethod = method.rawValue
        
        //        if method == .post {
        //            var postString = ""
        //            if let stringdata = Helper.getPostString(for: input) {
        //                postString = stringdata
        //            }
        //            urlRequest.httpBody = postString.data(using: String.Encoding.utf8)
        //        }
        
        DispatchQueue.global(qos: .default).async {
            
            let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                
                if let error = error {
                    completion(.failure(.cusom(error)))
                    return
                }else if (response as? HTTPURLResponse)?.statusCode != 200 {
                    completion(.failure(.badRequest))
                }
                
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                
                let decoder = JSONDecoder()
                if let model = try? decoder.decode(T.self, from: data){
                    completion(.success((model,response)))
                }else{
                    completion(.failure(.decodingError))
                    return
                }
            })
            
            task.resume()
        }
        
    }
    
}
