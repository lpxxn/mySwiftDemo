//
//  JsonHelper.swift
//  AlamofireDemo
//
//  Created by peng.li on 16/6/3.
//  Copyright © 2016年 peng.li.xxn. All rights reserved.
//

import Foundation
import ObjectMapper

class restAPIResponseBase : Mappable {
    var resultCode: String!
    var errorCode: String!
    var resultDesc: String?
    var IsSucess: Bool! {
        get {
            if resultCode.isEmpty == true {
                return false
            } else {
                return true
            }
        }
    }
    
    init() {

    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        resultCode <- map["resultCode"]
        errorCode <- map["errorCode"]
        resultDesc <- map["resultDesc"]
    }
    
}

class restAPIResponse<T: Mappable>: restAPIResponseBase {
    var result: [T]?// = [T]()
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        result <- map["result"]
    }
    
}

class restAPIResponseTest: restAPIResponseBase {
    var result: [reportModel] = [reportModel]()
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        result <- map["result"]
    }
    
}

class restAPIResponseTest2: Mappable {
    var result: [reportModel] = [reportModel]()
    
    required init?(_ map: Map) {
 
    }
    
    func mapping(map: Map) {
        result <- map["result"]
    }
    
}


class reportModel: Mappable {
    var id: String!
    
    init() {
        
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
    }
    
}