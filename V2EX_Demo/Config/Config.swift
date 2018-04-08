//
//  Config.swift
//  V2EX_Demo
//
//  Created by YueWen on 2018/4/8.
//  Copyright © 2018 vsKing. All rights reserved.
//

import UIKit

protocol Config {
    
    func config(model:RequestModel?)
}


extension Config {
    
    func config(model:RequestModel){
        print("config Start")
    }
}


extension DetailView :Config {

    func config(model:RequestModel?) {
        
        guard let model = model else { return }
        
        self.title?.text = model.title
        self.time?.text = DateFormatter.init().Int2DateString(dateInterval: model.created!)
        self.author?.text = (model.member?["username"] as! String)
        self.content?.text = model.content
    }
}


extension DisplayCell :Config {
    //MARK: 初始化数据
    func config(model:RequestModel?) {
        
        guard let model = model else { return }
        
        self.userName?.text = (model.member?["username"] as! String)
        self.title?.text = model.title
        self.content?.text = model.content;
        self.replies?.text = String.init(format: "阅读量：%d", model.replies!)
        let date:String = DateFormatter.init().Int2DateTimeString(dateInterval: model.created!)
        self.created?.text = date
    }
    
}
