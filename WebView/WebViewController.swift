//
//  ViewController.swift
//  WebView
//
//  Created by Yulia Novikova on 6/1/20.
//  Copyright © 2020 Yulia. All rights reserved.
//

import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    
    lazy var webView: WKWebView = {
        let userScript = WKUserScript(source: Scripts.hideElements,
                                      injectionTime: .atDocumentEnd,
                                      forMainFrameOnly: true)
        
        let userContentController = WKUserContentController()
        userContentController.addUserScript(userScript)
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        
        let webView = WKWebView(frame: .zero, configuration: configuration)
        
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutWebView()
        addProgressObserver()
        loadTaaviFeed()
    }
    
    private func layoutWebView() {
        view.insertSubview(webView, at: 0)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    private func addProgressObserver() {
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    private func loadTaaviFeed() {
        if let url = URL(string: "https://jointaavi.com/our-village/") {
            let reqeust = URLRequest(url: url)
            webView.load(reqeust)
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            UIView.animate(withDuration: 0.4) {
                self.progressView.setProgress(Float(self.webView.estimatedProgress), animated: true)
            }
        }
    }
}


