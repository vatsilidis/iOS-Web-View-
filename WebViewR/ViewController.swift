//
//  ViewController.swift
//  WebViewR
//
//  Created by Λάμπρος on 16/8/20.
//  Copyright © 2020 Vatsilidis. All rights reserved.
//

import UIKit
import WebKit

// implementing the WKNavigationDelegate protocol
class ViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    
    override func loadView() {
        // prepare the webview with delegate function
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // save URL
        let url = URL(string: "https://YOUR_LINK_HERE.com/")!
        let urlRequest = URLRequest(url: url)
        // enable JS
        webView.configuration.preferences.javaScriptEnabled = true
        // load URL
        webView.load(urlRequest)
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    title = webView.title
    }


    // Custom Buttons Back, Front, Refresh, Stop
    @IBAction func backButton(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    @IBAction func frontButton(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    @IBAction func refreshButton(_ sender: Any) {
        webView.reload()
    }
    @IBAction func stopButton(_ sender: Any) {
        webView.stopLoading()
    }
    
}

