//
//  Model.swift
//  cellTest
//
//  Created by ls on 2017/11/8.
//  Copyright © 2017年 ls. All rights reserved.
//

import UIKit
import Foundation

struct item {
    var title : String
    var info : String
    init(_ title:String,info:String) {
        self.title = title
        self.info = info
    }
}


struct section {
    var items : [item]
    var title : String
    var show : Bool
    init(_ title:String,items:[item],show:Bool=true) {
        
        self.title = title
        self.items = items
        self.show = show
        
    }
}

var sectionModel = [
    
    section("header01",items:[
        item("cell01",info:"cell0000000001"),
        item("cell02",info:"cell0000000002"),
        item("cell03",info:"cell0000000003")
    ]),
    section("header02",items:[
        item("cell01",info:"cell0000000001"),
        item("cell02",info:"cell0000000002"),
        ],show:true)

]
