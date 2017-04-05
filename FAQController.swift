//
//  FAQController.swift
//  CPCCS App
//
//  Created by Leonardo on 4/4/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//

import UIKit

class FAQController: UIViewController {
    @IBOutlet weak var preg1: UIButton!
    @IBOutlet weak var preg2: UIButton!
    @IBOutlet weak var preg3: UIButton!
    @IBOutlet weak var preg4: UIButton!
    @IBOutlet weak var preg5: UIButton!
    @IBOutlet weak var preg6: UIButton!
    @IBOutlet weak var preg7: UIButton!
    @IBOutlet weak var preg8: UIButton!
    @IBOutlet weak var preg9: UIButton!
    @IBOutlet weak var preg10: UIButton!
    @IBOutlet weak var preg11: UIButton!
    @IBOutlet weak var preg12: UIButton!
    @IBOutlet weak var preg13: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBorders(button: preg1)
        addBorders(button: preg2)
        addBorders(button: preg3)
        addBorders(button: preg4)
        addBorders(button: preg5)
        addBorders(button: preg6)
        addBorders(button: preg7)
        addBorders(button: preg8)
        addBorders(button: preg9)
        addBorders(button: preg10)
        addBorders(button: preg11)
        addBorders(button: preg12)
        addBorders(button: preg13)
    }
    
    func addBorders(button: UIButton){
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.gray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
