//
//  View2.swift
//  segueTypeDemo
//
//  Created by peng.li on 16/6/5.
//  Copyright © 2016年 peng.li.xxn. All rights reserved.
//

import UIKit

class View2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
