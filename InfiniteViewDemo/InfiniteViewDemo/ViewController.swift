//
//  ViewController.swift
//  InfiniteViewDemo
//
//  Created by peng.li on 16/6/21.
//  Copyright © 2016年 pengli.xxn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var layerView : UIView!
    
    var pagerController : ViewPagerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pagerController = ViewPagerController()
        pagerController.setParentController(self, parentView: self.layerView)
        
        var appearance = ViewPagerControllerAppearance()
        
        appearance.tabMenuHeight = 50.0
        appearance.scrollViewMinPositionY = 0.0
        appearance.scrollViewObservingType = .NavigationBar(targetNavigationBar: self.navigationController!.navigationBar)
        
        appearance.tabMenuAppearance.backgroundColor = UIColor.whiteColor()
        appearance.tabMenuAppearance.selectedViewBackgroundColor = UIColor.redColor()
        appearance.tabMenuAppearance.highlightedTitleColor = UIColor.greenColor()
        appearance.tabMenuAppearance.selectedTitleColor = UIColor.greenColor()
        //menu下边的条
        appearance.tabMenuAppearance.selectedViewInsets = UIEdgeInsets(top: 47, left: 0, bottom: 0, right: 0)
        
        pagerController.updateAppearance(appearance)
        
        pagerController.willBeginTabMenuUserScrollingHandler = { selectedView in
            selectedView.alpha = 0.0
        }
        
        pagerController.didEndTabMenuUserScrollingHandler = { selectedView in
            selectedView.alpha = 1.0
        }
        
        pagerController.changeObserveScrollViewHandler = { controller in
            let detailController = controller as! DetailViewController
            
            return detailController.tableView
        }
        
        pagerController.didChangeHeaderViewHeightHandler = { height in
            print("call didShowViewControllerHandler : \(height)")
        }
        
        for title in sampleDataTitles {
            let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
            controller.view.clipsToBounds = true
            controller.title = title
            controller.parentController = self
            pagerController.addContent(title, viewController: controller)
        }
        
        self.pagerController = pagerController
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "remove", style: .Plain, target: self, action: #selector(ViewController.remove))
    }
    
    @objc private func remove() {
        guard let c = self.pagerController?.childViewControllers.first else { return }
        self.pagerController?.removeContent(c)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.pagerController?.resetNavigationBarHeight(true)
    }


}

