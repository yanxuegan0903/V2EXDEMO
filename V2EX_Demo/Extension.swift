//
//  DateFormatter.swift
//  V2EX_Demo
//
//  Created by vsKing on 2018/4/8.
//  Copyright © 2018年 vsKing. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    func Int2String(dateInterval:Int) -> String {
        
        let formatter:DateFormatter = DateFormatter.init()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date:Date = Date.init(timeIntervalSince1970: TimeInterval(dateInterval))
        
        let dateTime:String = formatter.string(from: date)
        
        return dateTime;
        
    }
    
    
}
