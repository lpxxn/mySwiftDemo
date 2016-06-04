//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by peng.li on 16/6/2.
//  Copyright © 2016年 peng.li.xxn. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper
import ObjectMapper

class ViewController: UIViewController {

    @IBAction func btnConnectClick(sender: AnyObject) {
        
        let currRequest = Alamofire.request(.POST, "http://uat.erp.zgxcw.com/erpBase/financeOrderInfo/listPageFinanceOrderinfo", parameters: ["distributorId":"DEA480",
            "anyStatus":[0,1,2,3],
            "billOriginId":"8b1be2913fae442a950e10c60c73335b",
            "startDate":NSNull(),
            "pageIndex":1,
            "pageSize":20,
            "tradeType":1,
            "sort":"order_create_time",
            "order":"desc"
            ], encoding: .JSON, headers: ["Content-Type":"application/json",
                "token":"7a1a7c4afbe849f79e3ecb2cd8b4c128",
                "UserNo":"lp"])
        //// "token":"7a1a7c4afbe849f79e3ecb2cd8b4c128",
        //// .validate(statusCode: 200 ..< 600)
        currRequest.responseObject{(responseJson: Response<restAPIResponse<reportModel>, NSError>) in
            print(responseJson.response?.statusCode)
            print(responseJson.request)
            print(responseJson.response)
            print(responseJson.data)
            print(responseJson.result)
            
            switch responseJson.result {
            case .Success(let value):
                print("JSON:\(value)")
                print("------")
                let swiftyJsonVar = JSON(value)
                print(swiftyJsonVar)
                
                print(value.resultDesc ?? "")
                print(value.resultCode)
                print(value.result[0].id)
            case .Failure(let error):
                print(error)
                
            }
        }
        
        currRequest.responseJSON{responseJson in
            print(responseJson.response?.statusCode)
            print(responseJson.request)
            print(responseJson.response)
            print(responseJson.data)
            print(responseJson.result)
            
            switch responseJson.result {
            case .Success(let value):
                print("JSON:\(value)")
                print("------")
                let swiftyJsonVar = JSON(value)
                print(swiftyJsonVar)
                let model1 = Mapper<restAPIResponseTest2>().map(value)
                print(model1?.result[0].id)
                
                let model2 = Mapper<restAPIResponseTest2>().map(swiftyJsonVar.rawString())
                print(model2?.result[0].id)
                
                let model3 = Mapper<restAPIResponse<reportModel>>().map(value)
                print(model3?.result[0].id)

                
            case .Failure(let error):
                print(error)
                
            }

        
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

