//
//  SegueHandlerType.swift
//  segueTypeDemo
//
//  Created by peng.li on 16/6/5.
//  Copyright © 2016年 peng.li.xxn. All rights reserved.
//

import Foundation
import UIKit

protocol SegueHandlerType {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String {
    func performSegueWithIdentifier(segueIdentifier: SegueIdentifier, sender: AnyObject) {
        performSegueWithIdentifier(segueIdentifier.rawValue, sender: sender)
    }
    
    func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier,
            segueIdentifier = SegueIdentifier(rawValue: identifier)
        else {
            fatalError("invalid segue identifier \(segue.identifier)")
        }
        return segueIdentifier
    }
}