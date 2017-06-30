//
//  ViewController.swift
//  MyApp13
//
//  Created by iii-user on 2017/6/30.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController, BradProtocol{

    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func test1(_ sender: Any) {
        
        let url = URL(string: "http://www.iii.org.tw")
        let req = URLRequest(url: url!)
        
        webView.loadRequest(req)
        
    }
    
    @IBAction func test2(_ sender: Any) {
        
        let url = URL(string: "http://127.0.0.1/brad3.html")
        let req = URLRequest(url: url!)
        
        webView.loadRequest(req)
       
        
        
    }
    
    @IBAction func test3(_ sender: Any) {
//           webView.stringByEvaluatingJavaScript(from: "document.body.style.zoom = 4;")   放大
        let strCont = "<font size= '12' color='blue'> Hello,World</font>"
        webView.loadHTMLString(strCont, baseURL: nil)
        
        
    }
    
    @IBAction func test4(_ sender: Any) {
        
        let url = Bundle.main.url(forResource: "brad01", withExtension: "html")
        let req = URLRequest(url: url!)
        webView.loadRequest(req)
        
        //與網路無關 
        
        let jsContext = webView.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as! JSContext
        
        jsContext.setObject(self, forKeyedSubscript:"brad" as(NSCopying & NSObjectProtocol)!)
        
    }
    
    
    @IBAction func test5(_ sender: Any) {
        
        //由swift觸發javascript事件
//        
//        webView.stringByEvaluatingJavaScript(from: "alert('ok')")
        
//        let rand = arc4random_uniform(49) + 1
//        let doJS = "document.getElementById('here').innerHTML = '\(rand)'"
//        webView.stringByEvaluatingJavaScript(from: doJS)
        webView.stringByEvaluatingJavaScript(from: "test3()")
        
    }
    
    @IBAction func test6(_ sender: Any) {
        
        let url = Bundle.main.url(forResource: "map", withExtension: "html")
        let req = URLRequest(url: url!)
        webView.loadRequest(req)

    }
    
    @IBAction func test7(_ sender: Any) {
        let lat = 26.327689
        let lng = 127.803787
        let newpos = "moveToKD(\(lat),\(lng))"
      webView.stringByEvaluatingJavaScript(from: newpos)
    }
    
    func test10(){
        print("test10")
    }
    func test10(value: String){
        print("test10(\(value)")
    }
    func test20(){
        print("test20")
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    


}

//自訂呼叫的方法有哪些
@objc protocol BradProtocol : JSExport{
    func test10()
    func test10(value: String)
    func test20()
}


