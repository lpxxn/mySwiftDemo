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
import SwiftyRSA
import Heimdall

class ViewController: UIViewController {

    var startTime: CFTimeInterval!
    
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
                print(value.result?[0].id)
            case .Failure(let error):
                print(error)
                
            }
            
            let elapsedTime = CACurrentMediaTime() - self.startTime
            print(elapsedTime)

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
                print(model3?.result?[0].id)

                
            case .Failure(let error):
                print(error)
                
            }

        
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startTime = CACurrentMediaTime()
        
        print(startTime)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func RSAEncrypt(sender: AnyObject) {
        print(RSAByDateTime())
    }
    
    func RSAByDateTime() ->String {
        let currentTime = NSDate()
        print(currentTime)
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss:SSS"
        //let specDate = dateFormatter.dateFromString("2016/6/3 19:48:06:271")
        let specDate = dateFormatter.stringFromDate(currentTime)
        print(specDate)
        
        
        let longTime: String = String(convertDataTimeLong(currentTime))
        print(longTime)
        
        let rsaStr = RSAencrypt(longTime)
        
        print(rsaStr)
        return rsaStr
    }
    
    func convertDataTimeLong(date: NSDate)->Int64 {
        
        return Int64(date.timeIntervalSince1970 * 1000)
    }
    
    func RSAencrypt(content: String) -> String {
//        let publicKey = "<RSAKeyValue><Modulus>jwdBmiZ9kUyF/2ROhEoLT9/r6Zyark/2WYqa8ZGREZGGUlitK57EFxzGoqbxhE9B79M3nM8ZWWZYHaPNzooq5yjMgP0D+nwvT9Dn4RUfdAKVGfUb2AZimfYcK/mQTeAymi5O9h76kAlS62Y6HBZhLsZtKxs8cnxpC4YgxZlfTx8=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>"
        
//        let encryptedData = try! SwiftyRSA.encryptData(content.dataUsingEncoding(NSUTF8StringEncoding)!, publicKeyPEM: publicKey)
//        
//        return encryptedData
        
        /*1
        let heimdall = Heimdall(publicTag: "", publicKeyModulus: "wdBmiZ9kUyF/2ROhEoLT9/r6Zyark/2WYqa8ZGREZGGUlitK57EFxzGoqbxhE9B79M3nM8ZWWZYHaPNzooq5yjMgP0D+nwvT9Dn4RUfdAKVGfUb2AZimfYcK/mQTeAymi5O9h76kAlS62Y6HBZhLsZtKxs8cnxpC4YgxZlfTx8=".dataUsingEncoding(NSUTF8StringEncoding)!, publicKeyExponent: "AQAB".dataUsingEncoding(NSUTF8StringEncoding)!)
        
        print(heimdall?.encrypt(content))
        let base64 = heimdall?.encrypt(content.dataUsingEncoding(NSUTF8StringEncoding)!)?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        print(base64)
        return base64!
        */
        
        //return (heimdall?.encrypt(content.dataUsingEncoding(NSUTF8StringEncoding)!))!
        
        //
        
        
        let publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCPB0GaJn2RTIX/ZE6ESgtP3+vpnJquT/ZZiprxkZERkYZSWK0rnsQXHMaipvGET0Hv0zeczxlZZlgdo83OiirnKMyA/QP6fC9P0OfhFR90ApUZ9RvYBmKZ9hwr+ZBN4DKaLk72HvqQCVLrZjocFmEuxm0rGzxyfGkLhiDFmV9PHwIDAQAB"
        
        let encryptedData = try! SwiftyRSA.encryptData(content.dataUsingEncoding(NSUTF8StringEncoding)!, publicKeyPEM: publicKey)
        let base64 = encryptedData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        print(base64)
        return base64
    }
    
    @IBAction func LoginServer(sender: AnyObject) {
        
    }
    
}




