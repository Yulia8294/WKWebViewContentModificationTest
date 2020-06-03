//
//  WebViewController+NavigationDelegate.swift
//  WebView
//
//  Created by Yulia Novikova on 6/3/20.
//  Copyright © 2020 Yulia. All rights reserved.
//

import WebKit

extension WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        guard let urlTarget = navigationAction.request.url else { decisionHandler(.cancel); return }
        let urlString = urlTarget.absoluteString
        if urlString == "about:blank" {
            decisionHandler(.allow)
            return
        }
                
        if urlString.hasPrefix("https://jointaavi.com") {
            decisionHandler(.allow)
            return
        }
        
        if urlString.contains("facebook") && urlString.contains("plugin") {
            decisionHandler(.cancel)
            return
        }
        
        UIApplication.shared.open(urlTarget)
        decisionHandler(.cancel)
    }
    
    
    func webView(_: WKWebView, didStartProvisionalNavigation _: WKNavigation!) {
        
        if progressView.isHidden {
            progressView.isHidden = false
        }
        
        UIView.animate(withDuration: 0.3) {
            self.progressView.alpha = 1
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        UIView.animate(withDuration: 0.33,
                       animations: {
                        self.progressView.alpha = 0.0
        }, completion: { isFinished in self.progressView.isHidden = isFinished })
    }
}


