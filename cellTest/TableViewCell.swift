//
//  TableViewCell.swift
//  cellTest
//
//  Created by ls on 2017/11/8.
//  Copyright © 2017年 ls. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static func cellWithTableView(_ tableView:UITableView)->TableViewCell{
        let cellID = "UITableViewCellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = TableViewCell(style:.default,reuseIdentifier:cellID)
        
        }
        return cell as! TableViewCell
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
