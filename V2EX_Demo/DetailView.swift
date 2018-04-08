//
//  DetailView.swift
//  V2EX_Demo
//
//  Created by vsKing on 2018/4/8.
//  Copyright © 2018年 vsKing. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    //MARK: properties
    var title:UILabel?
    var time:UILabel?
    var author:UILabel?
    var content:UITextView?
    
    //  MARK: 初始化
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    
    //MARK: 初始化UI
    func initUI() {
        
        //  标题
        let title = UILabel.init()
        self.addSubview(title)
        title.numberOfLines = 0
        title.textColor = UIColor.black
        title.font = UIFont.systemFont(ofSize: 24)
        self.title = title
        
        //  发布时间
        let time = UILabel.init()
        self.addSubview(time)
        time.textColor = UIColor.gray
        time.font = UIFont.systemFont(ofSize: 12)
        self.time = time
        
        //  作者
        let author = UILabel.init()
        self.addSubview(author)
        author.textColor = UIColor.blue
        author.font = UIFont.systemFont(ofSize: 12)
        self.author = author
        
        //  内容
        let content = UITextView.init()
        self.addSubview(content)
        content.textColor = UIColor.black
        content.font = UIFont.systemFont(ofSize: 15)
        content.isEditable = false
        content.showsVerticalScrollIndicator = false
        self.content = content
        
    }
    
    //MARK: 初始化布局
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let margin:CGFloat = 10.0
        let titleWidth:CGFloat = self.frame.width - 2*margin
        let titleHeight:CGFloat = 60
        self.title?.frame = CGRect.init(x: margin, y: margin, width: titleWidth, height: titleHeight)
        
        let timeX:CGFloat = (self.title?.frame.minX)!
        let timeY:CGFloat = (self.title?.frame.maxY)! + margin
        let timeWidth:CGFloat = 100
        let timeHeight:CGFloat = 30
        self.time?.frame = CGRect.init(x: timeX, y: timeY, width: timeWidth, height: timeHeight)
        
        
        let authorX:CGFloat = (self.time?.frame.maxX)!
        let authorY:CGFloat = (self.time?.frame.minY)!
        let authorWidth:CGFloat = timeWidth*2.0
        let authorHeight:CGFloat = timeHeight
        self.author?.frame = CGRect.init(x: authorX, y: authorY, width: authorWidth, height: authorHeight)
        
        
        let contentX:CGFloat = (self.time?.frame.minX)!
        let contentY:CGFloat = (self.time?.frame.maxY)! + margin
        let contentWidth:CGFloat = titleWidth
        let contentHeight:CGFloat = self.frame.height-contentY
        self.content?.frame = CGRect.init(x: contentX, y: contentY, width: contentWidth, height: contentHeight)
        
    }

    //MARK:显示数据
    func config(model:RequestModel) {
        self.title?.text = model.title
        self.time?.text = DateFormatter.init().Int2DateString(dateInterval: model.created!)
        self.author?.text = model.member?.username
        self.content?.text = model.content
    }
    
}
