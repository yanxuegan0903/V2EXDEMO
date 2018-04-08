//
//  DetailViewController.swift
//  V2EX_Demo
//
//  Created by vsKing on 2018/4/8.
//  Copyright © 2018年 vsKing. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var model:RequestModel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        let detailView:DetailView = DetailView.init(frame: CGRect.init(x: 0, y: 64, width: self.view.frame.width, height: self.view.frame.height-64))
        self.view.addSubview(detailView)
        detailView.config(model: self.model)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
