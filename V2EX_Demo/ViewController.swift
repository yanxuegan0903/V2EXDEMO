//
//  ViewController.swift
//  V2EX_Demo
//
//  Created by vsKing on 2018/4/7.
//  Copyright © 2018年 vsKing. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView :UITableView?
    var modelArray:[RequestModel] = []
    var isLoadImage:Bool = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.initTableView()
        
        //  获取网络数据

        V2EXRequest().requestTopics {(modelArray) in
            
            print("model = ",modelArray)
            DispatchQueue.main.async {
                self.modelArray = modelArray
                self.tableView?.reloadData()
            }
        }
 
    }

    //MARK: 初始化 tableView
    func initTableView() {
        let rect = self.view.frame
        self.tableView = UITableView.init(frame: rect)
        self.tableView?.delegate = self;
        self.tableView?.dataSource = self;
        self.tableView?.register(DisplayCell.self, forCellReuseIdentifier: "DisplayCell")
        self.view.addSubview(self.tableView!)
        
    }
    
    //MARK: UITableViewDatasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelArray.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: DisplayCell = tableView.dequeueReusableCell(withIdentifier: "DisplayCell", for: indexPath) as! DisplayCell
        
        let model = self.modelArray[indexPath.row]
        
        cell.config(model: model)
        
        if self.isLoadImage {
            cell.url2Image(imgUrl: (model.member?.avatar_normal)!)
        }

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240;
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let model = self.modelArray[indexPath.row]
        let detailVC:DetailViewController = DetailViewController()
        detailVC.model = model
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    //MARK: 滑动时不加载图片
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.isLoadImage = true
        loadImageIcon()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.isLoadImage = false
    }
    
    
    func loadImageIcon() {
        
        let visibleArray = self.tableView?.indexPathsForVisibleRows
        for indexPath in visibleArray! {
            let model = self.modelArray[indexPath.row]
            let cell:DisplayCell = self.tableView?.cellForRow(at: indexPath) as! DisplayCell
            cell.url2Image(imgUrl: (model.member?.avatar_normal)!)
        }
    }
    
    
    
}

