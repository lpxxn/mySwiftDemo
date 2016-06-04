//
//  UserInfo.swift
//  AlamofireDemo
//
//  Created by peng.li on 16/6/4.
//  Copyright © 2016年 peng.li.xxn. All rights reserved.
//

import Foundation
import ObjectMapper


class UserInfo: Mappable {
    static let sharedInstance = UserInfo()
    
    var token: String?
    var userID: Int?
    var userNo: String?
    var userName: String?
    var adminFlg: Int?
    var password: String?
    var groupNo: String?
    /*
    * 权限值
    */
    var purstr: String?
    var distributorId: String?
    var distributorName: String?
    var companyName: String?
    
    init() {
        
    }
    required init?(_ map:Map) {
        
    }
    
    func mapping(map: Map) {
        UserInfo.sharedInstance.token <- map["token"]
        UserInfo.sharedInstance.userID <- map["userId"]
        UserInfo.sharedInstance.userNo <- map["userNo"]
        UserInfo.sharedInstance.userName <- map["userName"]
        UserInfo.sharedInstance.adminFlg <- map["adminFlag"]
        UserInfo.sharedInstance.groupNo <- map["groupNo"]
        UserInfo.sharedInstance.purstr <- map["purstr"]
        UserInfo.sharedInstance.distributorId <- map["distributorId"]
        UserInfo.sharedInstance.distributorName <- map["distributorName"]
    }
}

