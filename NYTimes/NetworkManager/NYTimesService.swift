//
//  Services.swift
//  NYTimes
//
//  Created by ahmed abdalla on 10/06/2022.
//

import Foundation

struct NYTimesService {
    
    
    func getMostPopularForSection(period : ArticlesPeriod, completion: @escaping (_ articles: [Article]?) -> ()) {
        let input = [
            "api-key" : Environment.apiKey
        ]
        
        NetworkManager.APICall(endUrl: "\(period.rawValue).json", input: input, method: .get, headers: nil, type: ArticleData.self) { result in
            switch result {
            case .success((let data,_)):
                if data.status?.uppercased() != "OK" {
                    return
                }
                completion(data.articles)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}

enum ArticlesPeriod: Int, CaseIterable {
    case day = 1
    case week = 7
    case month = 30
    
    var description:String{
        switch self {
        case .day: return "Today"
        case .week: return "Week"
        case .month: return "Month"
        }
    }
}
