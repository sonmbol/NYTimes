//
//  Environment.swift
//  NYTimes
//
//  Created by ahmed abdalla on 10/06/2022.
//
import UIKit

public enum Environment{
    
    enum Keys {
        static let apiKey = "API_KEY"
        static let baseUrl = "BASE_URL"
    }
    
    
    //    Get plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist file not found")
        }
        return dict
    }()
    
    //    Get apiKey and baseurl from plist
    static let baseURL: String = {
        guard let baseURLString = Environment.infoDictionary[Keys.baseUrl] as? String else {
            fatalError("Base URL not set in plist")
        }
        return baseURLString
    }()
    
    static let apiKey: String = {
        guard let apiKeyString = Environment.infoDictionary[Keys.apiKey] as? String else {
            fatalError("API Key not set in plist")
        }
        return apiKeyString
    }()
}
