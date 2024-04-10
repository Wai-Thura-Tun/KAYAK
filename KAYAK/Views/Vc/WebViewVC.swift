//
//  WebViewVC.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 27/03/2024.
//

import UIKit
import WebKit

class WebViewVC: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    
    override func loadView() {
            let webConfiguration = WKWebViewConfiguration()
            webView = WKWebView(frame: .zero, configuration: webConfiguration)
            webView.uiDelegate = self
            view = webView
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myURL = URL(string:"https://www.apple.com")
                let myRequest = URLRequest(url: myURL!)
                webView.load(myRequest)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
                webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
                webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        setUpView()
    }
    
    private func setUpView() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
                    title: "Cancel",
                    style: .plain,
                    target: self,
                    action: #selector(onTapCancel)
                )
    }
    
    @objc func onTapCancel() {
        dismiss(animated: true)
    }
}
