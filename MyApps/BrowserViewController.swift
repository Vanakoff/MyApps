//
//  BrowserViewController.swift
//  MyApps
//
//  Created by Andrey Vanakoff on 08/10/2023.
//

import UIKit
import WebKit

class BrowserViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webKitView: WKWebView!
    @IBOutlet weak var webSearchBar: UISearchBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webKitView.navigationDelegate = self
        
        loadURL()
    }
    
    private func loadURL() {
        let url = URL(string: "https://www.google.com")
        let request = URLRequest(url: url!)
        
        DispatchQueue.main.async {
            self.webKitView.load(request)
        }
    }

    //MARK: - Browser Navigation Methods
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        guard webKitView.canGoBack else { return }
        webKitView.goBack()
    }
    
    @IBAction func forwardButtonPressed(_ sender: UIBarButtonItem) {
        guard webKitView.canGoForward else { return }
        webKitView.goForward()
    }
    
    @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
        webKitView.reload()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        print(webSearchBar.text ?? "no URL")
    }
    
    //MARK: - Delegate Methods
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webSearchBar.text = webKitView.url?.absoluteString
    }
    
}
