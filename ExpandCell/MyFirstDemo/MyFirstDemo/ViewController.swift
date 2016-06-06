//
//  ViewController.swift
//  MyFirstDemo
//
//  Created by peng.li on 16/1/18.
//  Copyright © 2016年 peng.li. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var lab: UILabel!
    
    var selectedindexPath: NSIndexPath?
    
    var strData: [String] = ["A", "b", "c"]
    
    @IBOutlet var tableView: UIView!
    var lab1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func Click(sender: AnyObject) {
        lab.text = "Haha"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strData.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CustomerCell
        cell.lbName.text = "cell:" + String(indexPath.row) + strData[indexPath.row]
        return  cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let previousIndexPath = selectedindexPath
        if indexPath == selectedindexPath {
            selectedindexPath = nil
        }
        else {
            selectedindexPath = indexPath
        }
        
        var indexPaths: Array<NSIndexPath> = []
        
        if let previous = previousIndexPath {
            indexPaths.append(previous)
        }
        
        if let current = selectedindexPath {
            indexPaths.append(current)
        }
        
        if indexPaths.count > 0 {
            tableView.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! CustomerCell).watchFramChages()
    }
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! CustomerCell).ignoreFrameChanges()
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath == selectedindexPath {
            return  CustomerCell.expandeHeigth
        } else {
            return CustomerCell.defaultHeight
        }
    }

}

