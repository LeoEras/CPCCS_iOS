//
//  ViewController.swift
//  CPCCS App
//
//  Created by Leonardo on 3/15/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!

    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 6
        
    }

    @IBAction func openMenu(_ sender: Any) {
        if (menuShowing){
            leadingConstraint.constant = -260
        } else {
            leadingConstraint.constant = -55
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        
        menuShowing = !menuShowing
    }
}

