//
//  Helper.swift
//  NYTimes
//
//  Created by ahmed abdalla on 10/06/2022.
//

import UIKit

//
//class Helper {
//  
//
//
//    class func getPostString(for dict: [String: Any]) -> String? {
//        var postString = ""
//        for (index, item) in dict.enumerated() {
//            if index == 0 {
//                if item.value is [String: Any] {
////                    postString.append(self.getPostString(for: item.value as! [String : Any])!)
//                    postString.append("\(item.key)=\(String(describing: self.getPostString(for: item.value as! [String : Any])!))")
//                    
//                }
//                else {
//                    postString.append("\(item.key)=\(item.value)")
//                }
//                
//            }
//            else {
//                if item.value is [String: Any] {
//                    postString.append("&\(item.key)=(\(String(describing: self.getPostString(for: item.value as! [String : Any])!)))")
//                }
//                else {
//                    postString.append("&\(item.key)=\(item.value)")
//                }
//                
//            }
//        }
//        return postString
//        
//    }
//    
//}
