//
//  WebViewController.swift
//  BaseApp
//
//  Created by Aswani G on 8/2/20.
//  Copyright © 2020 RAS. All rights reserved.
//
import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        let myURL = URL(string: "http://localhost:3000")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        webView.allowsBackForwardNavigationGestures = true
    }
}

