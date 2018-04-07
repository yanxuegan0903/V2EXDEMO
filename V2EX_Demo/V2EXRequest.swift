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
        print("init")
    }

//    func ajaxTools(name:String ,completed:(runStr: String,isStop:Bool) -> String) -> String {
//        let resStr = name + "覆水难收"
//        completed(runStr: resStr, isStop: true)
//        return resStr + " - 内部函数返回"
//    }
    
    public func requestTopics(completed:@escaping (_ modelArray: NSMutableArray) -> Void) {

        let url: URL = URL.init(string: "https://www.v2ex.com/api/topics/hot.json")!
        
        let session: URLSession = URLSession.shared
        
        let dataTask:URLSessionDataTask = session.dataTask(with: url) { (data, response, error) in
            
            let array:NSArray
            
            array = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
            
            let modelArray:NSMutableArray = NSMutableArray.init()
            
            for dict in array {
                
                let model:V2EXModel = V2EXModel.init(dict: dict as! Dictionary<String, Any>);
                
                modelArray.add(model)
                
            }
            
            completed(modelArray)
        }
        
        
        dataTask.resume()
        
    }
    
    
    
}

