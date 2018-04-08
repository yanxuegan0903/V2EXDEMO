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

    
    public func requestTopics(completed:@escaping (_ modelArray: NSMutableArray) -> Void) {

        let url: URL = URL.init(string: "https://www.v2ex.com/api/topics/hot.json")!
        
        let session: URLSession = URLSession.shared
        
        let dataTask:URLSessionDataTask = session.dataTask(with: url) { (data, response, error) in
            
            let array:NSArray
            
            array = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
            
            let modelArr = Mapper<RequestModel>().mapArray(JSONArray: array as! [[String : Any]])
            
            let modelArray:NSMutableArray = NSMutableArray.init()
            
            for model:RequestModel in modelArr {
                modelArray.add(model)
            }
            
            completed(modelArray)
        }
        
        
        dataTask.resume()
        
    }
    
    
    
}

