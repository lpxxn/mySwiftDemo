//
//  CustomerCell.swift
//  MyFirstDemo
//
//  Created by peng.li on 16/5/30.
//  Copyright © 2016年 peng.li. All rights reserved.
//

import UIKit

var strObser = "myCellObs"
class CustomerCell: UITableViewCell {

    @IBOutlet weak var lbName: UILabel!
    
    @IBOutlet weak var stackA: UIStackView!
    
    var isObserving = false
    
    class var expandeHeigth: CGFloat {get{ return 100}}
    class var defaultHeight: CGFloat{get {return 44}}
    
    func checkHeigth() {
        stackA.hidden  = (frame.size.height < CustomerCell.expandeHeigth)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        
            super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func watchFramChages() {
        if !isObserving {
            addObserver(self, forKeyPath: strObser, options: .New, context: nil)
            checkHeigth()
            isObserving = true
        }
    }
    
    func ignoreFrameChanges() {
        if isObserving {
            removeObserver(self, forKeyPath: strObser)
            isObserving = false
        }
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == strObser {
            checkHeigth()
        }
    }

}
