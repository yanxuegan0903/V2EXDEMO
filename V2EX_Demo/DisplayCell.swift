//
//  DisplayCell.swift
//  V2EX_Demo
//
//  Created by vsKing on 2018/4/7.
//  Copyright © 2018年 vsKing. All rights reserved.
//

import UIKit

class DisplayCell: UITableViewCell {

    var model:V2EXModel?
    var avatar:UIImageView?
    var userName:UILabel?
    var title:UILabel?
    var content:UILabel?
    var replies:UILabel?
    var created:UILabel?
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initUI()
        
    }
    
    // MARK: 初始化UI
    func initUI() {
        
        let avatar:UIImageView = UIImageView.init()
        avatar.contentMode = UIViewContentMode.scaleAspectFit;
        self.contentView.addSubview(avatar)
        self.avatar = avatar
        
        
        let userName:UILabel = UILabel.init()
        self.contentView.addSubview(userName)
        userName.numberOfLines = 0
        self.userName = userName;
        
        let title:UILabel = UILabel.init()
        self.contentView.addSubview(title)
        title.numberOfLines = 0
        title.textAlignment = NSTextAlignment.center
        self.title = title;
        
        let content:UILabel = UILabel.init()
        self.contentView.addSubview(content)
        content.font = UIFont.systemFont(ofSize: 16)
        content.textColor = UIColor.lightGray
        content.numberOfLines = 0
        self.content = content;

        let replies:UILabel = UILabel.init()
        self.contentView.addSubview(replies)
        replies.font = UIFont.systemFont(ofSize: 14)
        self.replies = replies;

        let created:UILabel = UILabel.init()
        self.contentView.addSubview(created)
        created.font = UIFont.systemFont(ofSize: 14)
        self.created = created;

    }
    
    //MARK: 布局样式
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let avatarHeight:CGFloat = 40.0
        let margin:CGFloat = 5.0
        
        self.avatar?.frame = CGRect.init(x: margin, y: margin, width: avatarHeight, height: avatarHeight)
        
        
        let userNameX:CGFloat = (self.avatar?.frame.maxX)! + margin
        let userNameY:CGFloat = (self.avatar?.frame.minY)!;
        let userNameWidth:CGFloat = self.contentView.frame.width - 3*margin - avatarHeight
        let userNameHeight:CGFloat = avatarHeight
        self.userName?.frame = CGRect.init(x: userNameX, y: userNameY, width: userNameWidth, height: userNameHeight)
        
        let titleX:CGFloat = margin
        let titleY:CGFloat = (self.avatar?.frame.maxY)! + margin;
        let titleWidth:CGFloat = self.contentView.frame.width - 2*margin
        let titleHeight:CGFloat = avatarHeight
        self.title?.frame = CGRect.init(x: titleX, y: titleY, width: titleWidth, height: titleHeight)
        
        
        let contentX:CGFloat = (self.avatar?.frame.minX)!
        let contentY:CGFloat = (self.title?.frame.maxY)! + margin
        let contentWidth:CGFloat = self.contentView.frame.width-2*margin
        let contentHeight:CGFloat = 100
        self.content?.frame = CGRect.init(x: contentX, y: contentY, width: contentWidth, height: contentHeight)
        
        
        let repliesX:CGFloat = (self.content?.frame.minX)!
        let repliesY:CGFloat = (self.content?.frame.maxY)! + margin
        let repliesWidth:CGFloat = (self.contentView.frame.width-3*margin)/2.0
        let repliesHeight:CGFloat = 30
        self.replies?.frame = CGRect.init(x: repliesX, y: repliesY, width: repliesWidth, height: repliesHeight)
        
        
        let createdX:CGFloat = (self.replies?.frame.maxX)! + margin
        let createdY:CGFloat = repliesY
        let createdWidth:CGFloat = repliesWidth
        let createdHeight:CGFloat = repliesHeight
        self.created?.frame = CGRect.init(x: createdX, y: createdY, width: createdWidth, height: createdHeight)
    }
    
    
    //MARK: 初始化数据
    func configModelData(model:V2EXModel) {
        self.model = model;
        
        self.userName?.text = (model.member?["username"] as! String)
        
        self.title?.text = model.title
        
        self.content?.text = model.content;
        
        self.replies?.text = String.init(format: "阅读量：%d", model.replies!)
        
        let date:String = DateFormatter.init().Int2String(dateInterval: model.created!)
        
        self.created?.text = date
    }
    
    
    func url2Image(imgUrl:String) {
        
        let imageUrl = String.init(format: "http:%@", imgUrl)
        
        let data = try! Data(contentsOf: URL.init(string: imageUrl)!)
        
        let image:UIImage = UIImage.init(data: data)!
        
        DispatchQueue.main.async {
            print("更新头像")
            self.avatar?.image = image;
        }
        
    }
    
    
}
