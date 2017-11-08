//
//  ViewController.swift
//  cellTest
//
//  Created by ls on 2017/11/8.
//  Copyright © 2017年 ls. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.sectionHeaderHeight = 48
//        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionModel.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       let section_My = sectionModel[section]
        return section_My.show ? section_My.items.count : 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let sectionM = sectionModel[indexPath.section]
        
        let cell = TableViewCell.cellWithTableView(tableView)
        cell.textLabel?.text = sectionM.items[indexPath.row].title
        return cell
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionM = sectionModel[section]
        
        let headView = tableHeaderView.headViewWithTableView(tableView)
       
        headView.delegate = self
        headView.setLeftBottom(sectionM.show)
        headView.section = section
        headView.textLabel?.text = sectionM.title
        
        return headView

    }


}
extension ViewController : tableHeaderViewDelegate{
    
    func tableHeaderViewDelegateClick(_ head: tableHeaderView, num: Int) {
      
        let isShow = sectionModel[num].show
       
        sectionModel[num].show = !isShow
        
        let index = IndexSet(integer:num)
        
       tableView.reloadSections(index, with: .fade)

        
        
    }
    
}

