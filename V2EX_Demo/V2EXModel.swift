//
//  V2EXModel.swift
//  V2EX_Demo
//
//  Created by vsKing on 2018/4/7.
//  Copyright © 2018年 vsKing. All rights reserved.
//

import UIKit



class V2EXModel: NSObject {
    
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
    
    init(dict:Dictionary<String, Any>){
        super.init()
        
        self.id = dict["id"] as? Int
        self.title = dict["title"] as? String
        self.url = dict["url"] as? String
        self.content = dict["content"] as? String
        self.content_rendered = dict["content_rendered"] as? String
        self.replies = dict["replies"] as? Int
        self.member = dict["member"] as? Dictionary
        self.node = dict["node"] as? Dictionary
        self.created = dict["created"] as? Int
        self.last_modified = dict["id"] as? Int
        self.last_touched = dict["id"] as? Int

        
    }

}
