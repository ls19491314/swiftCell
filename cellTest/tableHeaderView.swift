//
//  tableHeaderView.swift
//  cellTest
//
//  Created by ls on 2017/11/8.
//  Copyright © 2017年 ls. All rights reserved.
//

import UIKit

protocol tableHeaderViewDelegate {
    
    func tableHeaderViewDelegateClick(_ head:tableHeaderView,num:Int)
    
}

class tableHeaderView: UITableViewHeaderFooterView {
    
    var delegate : tableHeaderViewDelegate?
    var section : Int = 0
    
    init(reuseIdentifier:String) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupRight()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    static func headViewWithTableView(_ tableView:UITableView)->tableHeaderView{
        
        let headID = "tableHeaderViewID"
        
        var headView  = tableView.dequeueReusableHeaderFooterView(withIdentifier: headID)
        
        if headView == nil
        {
            headView = tableHeaderView(reuseIdentifier:headID)
        }
        
        return headView as! tableHeaderView
        
    }
 
    override func layoutSubviews() {
        super.layoutSubviews()
        rightButton.frame = CGRect(x:(contentView.bounds.width)-60,y:0,width:48,height:48)
       
    }
    
    
    
    func setupRight(){
       
      
        contentView.addSubview(rightButton)
    }

    lazy var rightButton : UIButton = {
        
       let btn = UIButton()
       
        btn.setTitle(">", for: .normal)
        btn.setTitleColor(.gray, for: .normal)
      
        btn.addTarget(self, action: #selector(tapHeadView), for: .touchUpInside)
        
        return btn
    }()
    func setLeftBottom(_ show:Bool){

        let animate = CABasicAnimation(keyPath: "transform.rotation.z")
        

        
        animate.toValue = show ? Double.pi*0.5 : 0
        animate.duration = 0.2
        animate.isRemovedOnCompletion = false
        animate.fillMode = kCAFillModeForwards
        rightButton.layer.add(animate, forKey: nil)
    
    }
    @objc fileprivate func tapHeadView(){
       
        if (delegate != nil)
        {
           
            delegate?.tableHeaderViewDelegateClick(self,num:section)
        }
        
    }
    
}

