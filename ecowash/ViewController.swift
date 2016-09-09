//
//  ViewController.swift
//  ecowash4
//
//  Created by chinelo mail on 8/19/16.
//  Copyright © 2016 chinelo mail. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var ActInd: UIActivityIndicatorView!
    @IBOutlet var WebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.WebView.delegate = self
        ActInd.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "http://www.theecowash.com")
        WebView.loadRequest(URLRequest(url: url!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == UIWebViewNavigationType.linkClicked {
            let application = UIApplication.shared
            if let phoneURL = request.url , (phoneURL.absoluteString.range(of: "tel:") != nil) {
                if application.canOpenURL(phoneURL) {
                    application.openURL(phoneURL)
                    return false
                }
            }
        } 
        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView)
    {
        // here show your indicator
        ActInd.isHidden = false
        ActInd.startAnimating()
        
    }
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        // here hide it
        ActInd.isHidden = true
        ActInd.startAnimating()
        
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error)
    {
        ActInd.isHidden = true
        print("Please reload page")
        
    }
    
    //override func prefersStatusBarHidden() -> Bool {
       // return true
    //}
    
}
