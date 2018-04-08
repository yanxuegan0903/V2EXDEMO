//
//  V2EXRequest.swift
//  V2EX_Demo
//
//  Created by vsKing on 2018/4/7.
//  Copyright © 2018年 vsKing. All rights reserved.
//

import UIKit



class V2EXRequest: NSObject {
    
    
    
    
    
    override init() {
        
    }

    
    public func requestTopics(completed:@escaping (_ modelArray: [RequestModel]) -> Void) {

        let url: URL = URL.init(string: "https://www.v2ex.com/api/topics/hot.json")!
        
        let session: URLSession = URLSession.shared
        
        let dataTask:URLSessionDataTask = session.dataTask(with: url) { (data, response, error) in
  
/*
            let array:NSArray

            array = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray

            let modelArr = Mapper<RequestModel>().mapArray(JSONArray: array as! [[String : Any]])

            print(modelArr)

            completed(modelArr as! NSMutableArray)
*/
            // 转成对象
            guard let jsonData = data else { return }
            guard let array = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) else { return }
            
            let modelArr = Mapper<RequestModel>().mapArray(JSONObject: array)
            
            completed((modelArr)!)
            
        }
        dataTask.resume()
        
    }
    
    
    
}

