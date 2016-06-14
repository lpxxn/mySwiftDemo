//
//  ViewController.swift
//  FaceBookLoginView
//
//  Created by peng.li on 16/6/14.
//  Copyright © 2016年 pengli.xxn. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var loginContentView: UIView!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    @IBOutlet weak var signUpBtn: UIButton!
    var isMovied = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // btn
        loginBtn.layer.cornerRadius = 3
        
        // text
        userText.delegate = self
        passwordText.delegate = self
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyborad))
//        view.addGestureRecognizer(tap)
    }

    func dismissKeyborad() {
        
       view.endEditing(true)
    }
    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: UITextFieldDelegate
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    func keyboardWillShow(notification: NSNotification) {
        if isMovied {
            return
        }
        isMovied = true
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            
            UIView.animateWithDuration(0.25, animations: {
                self.view.frame.origin.y -= keyboardSize.height
                }
            )
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        isMovied = false
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            UIView.animateWithDuration(0.25, animations: {
                self.view.frame.origin.y += keyboardSize.height
            })
        }
    }

    @IBAction func endEdit(sender: AnyObject) {
        dismissKeyborad()
    }
    
    @IBAction func Login(sender: AnyObject) {
        
        loadingView.startAnimating()
        loginBtn.selected = true
        delay(3.0, closure: {
            self.loadingView.stopAnimating()
        })
        
    }
    
    func delay(delay: Double, closure: ()->()) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
    }
    
}

