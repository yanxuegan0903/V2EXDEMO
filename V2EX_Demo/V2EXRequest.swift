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
        super.init()
    }

    //MARK: 网络请求展示的数据
    public func requestTopics(completed:@escaping (_ modelArray: [RequestModel]) -> Void) {

        let url: URL = URL.init(string: "https://www.v2ex.com/api/topics/hot.json")!
        
        let session: URLSession = URLSession.shared
        
        let dataTask:URLSessionDataTask = session.dataTask(with: url) { (data, response, error) in
  
            guard let jsonData = data else { return }
            guard let array = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) else { return }
            
            let modelArr = Mapper<RequestModel>().mapArray(JSONObject: array)
            
            completed((modelArr)!)
        }
        
        dataTask.resume()
        
    }
    
    
    
}

