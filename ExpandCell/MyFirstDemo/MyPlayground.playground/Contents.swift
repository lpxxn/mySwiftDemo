//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"
var currentTime = NSDate()
print(currentTime)

var dateFormatter: NSDateFormatter = NSDateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss:SSS"
var dateInFormat:String = dateFormatter.stringFromDate(currentTime)
print(dateInFormat)

var curTime2 = NSData()
print(curTime2)

func getCurrentMillis()->Int64 {
    return Int64(NSDate().timeIntervalSince1970*1000)
}

var currentDouble = getCurrentMillis()
print(currentDouble)

func getCurrentMillis2(date: NSDate)->Int64 {
    return Int64(date.timeIntervalSince1970*1000)
}



let specDate = dateFormatter.dateFromString("2016/6/3 19:48:06:271")
print(specDate)

print(getCurrentMillis2(specDate!))
