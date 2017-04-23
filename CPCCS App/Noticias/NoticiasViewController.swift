//
//  NoticiasViewController.swift
//  CPCCS App
//
//  Created by Leonardo on 4/21/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//

import UIKit

class NoticiasViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://twitter.com/CPCCS")
        webView.loadRequest(URLRequest(url: url!))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
     
    }
}
