//
//  WikiViewController.swift
//  Westeros
//
//  Created by yisus on 17/07/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController {
    
    @IBOutlet weak var browserView: UIWebView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    let model: House
    
    init (model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel () {
        activityView.isHidden = false
        activityView.startAnimating()
        title = model.name
        browserView.delegate = self
        browserView.loadRequest(URLRequest(url: model.wikiURL))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
             
        syncViewWithModel()
    }
}

extension WikiViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityView.stopAnimating()
        activityView.isHidden = true
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if (navigationType == .linkClicked || navigationType == .formSubmitted) {
            return false
        }
        
        return true
        
    }

}
