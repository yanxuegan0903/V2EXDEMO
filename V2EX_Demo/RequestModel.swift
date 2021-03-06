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
    var member: Member?
    var node: Node?
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


//MARK: 子类 member

class Member: Mappable {
    
    var id:Int?
    var username:String?
    var tagline:String?
    var avatar_mini:String?
    var avatar_normal:String?
    var avatar_large:String?

    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id                  <- map["id"]
        username            <- map["username"]
        tagline             <- map["tagline"]
        avatar_mini         <- map["avatar_mini"]
        avatar_normal       <- map["avatar_normal"]
        avatar_large        <- map["avatar_large"]
        
    }
    
    
    
}

//MARK: 子类 Node

class Node: Mappable {
    
    var id:Int?
    var name:String?
    var title:String?
    var title_alternative:String?
    var topics:Int?
    var avatar_mini:String?
    var avatar_normal:String?
    var avatar_large:String?

    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id                  <- map["id"]
        name                <- map["name"]
        title               <- map["title"]
        title_alternative   <- map["title_alternative"]
        topics              <- map["topics"]
        avatar_mini         <- map["avatar_mini"]
        avatar_normal       <- map["avatar_normal"]
        avatar_large        <- map["avatar_large"]
    }
    
    
    
}


