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
        
        //appearance.headerHeight = 200.0
        appearance.headerHeight = 50.0
        //appearance.scrollViewMinPositionY = 20.0
        //appearance.scrollViewObservingType = .Header
        
        let imageView = UIImageView(image: UIImage(named: "sample_header_image.jpg"))
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        appearance.headerContentsView = imageView
        
        appearance.tabMenuAppearance.selectedViewBackgroundColor = UIColor.greenColor()
        appearance.tabMenuAppearance.selectedViewInsets = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        
        pagerController.updateAppearance(appearance)
        
        pagerController.updateSelectedViewHandler = { selectedView in
            selectedView.layer.cornerRadius = selectedView.frame.size.height * 0.5
        }
        
        pagerController.willBeginTabMenuUserScrollingHandler = { selectedView in
            print("call willBeginTabMenuUserScrollingHandler")
            selectedView.alpha = 0.0
        }
        
        pagerController.didEndTabMenuUserScrollingHandler = { selectedView in
            print("call didEndTabMenuUserScrollingHandler")
            selectedView.alpha = 1.0
        }
        
        pagerController.didShowViewControllerHandler = { controller in
            print("call didShowViewControllerHandler")
            print("controller : \(controller.title)")
            let currentController = pagerController.currentContent()
            print("currentContent : \(currentController?.title)")
        }
        
        pagerController.changeObserveScrollViewHandler = { controller in
            print("call didShowViewControllerObservingHandler")
            let detailController = controller as! DetailViewController
            
            return detailController.tableView
        }
        
        pagerController.didChangeHeaderViewHeightHandler = { height in
            print("call didChangeHeaderViewHeightHandler : \(height)")
        }
        
        pagerController.didScrollContentHandler = { percentComplete in
            print("call didScrollContentHandler : \(percentComplete)")
        }
        
        for title in sampleDataTitles {
            let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
            controller.view.clipsToBounds = true
            controller.title = title
            controller.parentController = self
            pagerController.addContent(title, viewController: controller)
        }
        
        self.pagerController = pagerController
        
//        let pagerController = ViewPagerController()
//        pagerController.setParentController(self, parentView: self.layerView)
//        
//        var appearance = ViewPagerControllerAppearance()
//        
//        appearance.tabMenuHeight = 50.0
//        appearance.scrollViewMinPositionY = 20.0
//        appearance.scrollViewObservingType = .NavigationBar(targetNavigationBar: self.navigationController!.navigationBar)
//        
//        appearance.tabMenuAppearance.backgroundColor = UIColor.whiteColor()
//        appearance.tabMenuAppearance.selectedViewBackgroundColor = UIColor.greenColor()
//        appearance.tabMenuAppearance.highlightedTitleColor = UIColor.greenColor()
//        appearance.tabMenuAppearance.selectedTitleColor = UIColor.greenColor()
//        //menu下边的条
//        appearance.tabMenuAppearance.selectedViewInsets = UIEdgeInsets(top: 47, left: 0, bottom: 0, right: 0)
//        
//        pagerController.updateAppearance(appearance)
//        
//        pagerController.willBeginTabMenuUserScrollingHandler = { selectedView in
//            selectedView.alpha = 0.0
//        }
//        
//        pagerController.didEndTabMenuUserScrollingHandler = { selectedView in
//            selectedView.alpha = 1.0
//        }
//        
//        pagerController.changeObserveScrollViewHandler = { controller in
//            let detailController = controller as! DetailViewController
//            
//            return detailController.tableView
//        }
//        
//        pagerController.didChangeHeaderViewHeightHandler = { height in
//            print("call didShowViewControllerHandler : \(height)")
//        }
//        
//        for title in sampleDataTitles {
//            let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
//            controller.view.clipsToBounds = true
//            controller.title = title
//            controller.parentController = self
//            pagerController.addContent(title, viewController: controller)
//        }
//        
//        self.pagerController = pagerController
//        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "remove", style: .Plain, target: self, action: #selector(ViewController.remove))
        
        
        
        
       
        self.pagerController?.tabMenuView.scrollToCenter(1, animated: true, animation: nil, completion: nil)
        
        self.pagerController?.tabMenuView.layoutIfNeeded()
        self.pagerController?.tabMenuView.setNeedsLayout()
    }
    
    @objc private func remove() {
        guard let c = self.pagerController?.childViewControllers.first else { return }
        self.pagerController?.removeContent(c)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.pagerController?.resetNavigationBarHeight(true)
        //
        //    
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//       pagerController?.tabMenuView.scrollToCenter(0, animated: true, animation: nil, completion: nil)
//        pagerController?.tabMenuView.stopScrolling(0)

    }

}

