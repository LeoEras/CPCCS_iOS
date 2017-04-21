//
//  FAQController.swift
//  CPCCS App
//
//  Created by Leonardo on 4/4/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//

import UIKit

class FAQController: UIViewController {
    var FAQSelected = DataHolder.shared
    
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
    
    @IBAction func chooseQuestion(_ sender: UIButton) {
        if(sender == preg1){
            //FAQSelected.setFAQSelected(opcion: 1)
        } else if (sender == preg2){
            //FAQSelected.setFAQSelected(opcion: 2)
        } else if (sender == preg3){
            //FAQSelected.setFAQSelected(opcion: 3)
        } else if (sender == preg4){
            //FAQSelected.setFAQSelected(opcion: 4)
        } else if (sender == preg5){
            //FAQSelected.setFAQSelected(opcion: 5)
        } else if (sender == preg6){
            FAQSelected.setFAQSelected(opcion: 6)
        } else if (sender == preg7){
            FAQSelected.setFAQSelected(opcion: 7)
        } else if (sender == preg8){
            FAQSelected.setFAQSelected(opcion: 8)
        } else if (sender == preg9){
            FAQSelected.setFAQSelected(opcion: 9)
        } else if (sender == preg10){
            FAQSelected.setFAQSelected(opcion: 10)
        } else if (sender == preg11){
            FAQSelected.setFAQSelected(opcion: 11)
        } else if (sender == preg12){
            FAQSelected.setFAQSelected(opcion: 12)
        } else if (sender == preg13){
            //FAQSelected.setFAQSelected(opcion: 13)
        }
        
        if(FAQSelected.getFAQSelected() != 0) {
            self.performSegue(withIdentifier: "showQuestion", sender: self)
        }
    }
    
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
