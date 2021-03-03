//
//  VKLoginFormViewController.swift
//  VK
//
//  Created by Karahanyan Levon on 22.02.2021.
//

import UIKit
import WebKit

class VKLoginFormViewController: UIViewController {

    let userData = UserFriendsService()
    
    @IBOutlet weak var webview: WKWebView? {
        didSet {
            webview?.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addVKLoginFormToWebview()
    }
    
    func addVKLoginFormToWebview() {
        
        var urlComponents = URLComponents()
            urlComponents.scheme = "https"
            urlComponents.host = "oauth.vk.com"
            urlComponents.path = "/authorize"
            urlComponents.queryItems = [
                URLQueryItem(name: "client_id", value: "7768748"),
                URLQueryItem(name: "display", value: "mobile"),
                URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                URLQueryItem(name: "scope", value: "262150"),
                URLQueryItem(name: "response_type", value: "token"),
                URLQueryItem(name: "v", value: "5.68")
            ]
                
        let request = URLRequest(url: urlComponents.url!)
        
        webview?.load(request)
    }
}

extension VKLoginFormViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = makeDictionary(from: fragment)
        
        guard let token = params["access_token"] else {
            decisionHandler(.cancel)
            return
        }
        
        Session.instance.token = token
        decisionHandler(.allow)
        
        userData.getUserPhoto()
        userData.getUserFriends()
        userData.getUserGroups()
        userData.getUserSearchGroups()
    }
    
    func makeDictionary(from fragment: String) -> [String: String] {
        
        return fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                
                dict[key] = value
                return dict
        }
    }
}
