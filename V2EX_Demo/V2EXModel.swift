//
//  V2EXModel.swift
//  V2EX_Demo
//
//  Created by vsKing on 2018/4/7.
//  Copyright © 2018年 vsKing. All rights reserved.
//

import UIKit

class V2EXModel: NSObject {
    
    var id: String?
    var title: Int?
    var url: String?
    var content: String?
    var content_rendered: String?
    var replies: String?
    var member: Dictionary<String, Any>?
    var node: Dictionary<String, Any>?
    var created: Int?
    var last_modified: Int?
    var last_touched: Int?
    
}
