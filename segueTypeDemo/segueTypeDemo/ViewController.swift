//
//  ViewController.swift
//  segueTypeDemo
//
//  Created by peng.li on 16/6/5.
//  Copyright © 2016年 peng.li.xxn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SegueHandlerType {

    enum SegueIdentifier: String {
        case ShowView1
        case ShowView2
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openView1(sender: AnyObject) {
        performSegueWithIdentifier(.ShowView1, sender: self)
    }
    @IBAction func openView2(sender: AnyObject) {
        performSegueWithIdentifier(.ShowView2, sender: self)
    }
}

