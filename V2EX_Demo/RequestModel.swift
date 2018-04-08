//
//  RequestModel.swift
//  V2EX_Demo
//
//  Created by vsKing on 2018/4/8.
//  Copyright © 2018年 vsKing. All rights reserved.
//

import UIKit

class RequestModel: Mappable {
    
    var id: Int?
    var title: String?
    var url: String?
    var content: String?
    var content_rendered: String?
    var replies: Int?
    var member: Dictionary<String, Any>?
    var node: Dictionary<String, Any>?
    var created: Int?
    var last_modified: Int?
    var last_touched: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id                      <- map["id"]
        title                   <- map["title"]
        url                     <- map["url"]
        content                 <- map["content"]
        content_rendered        <- map["content_rendered"]
        replies                 <- map["replies"]
        member                  <- map["member"]
        node                    <- map["node"]
        created                 <- map["created"]
        last_modified           <- map["last_modified"]
        last_touched            <- map["last_touched"]
    }
    
}

