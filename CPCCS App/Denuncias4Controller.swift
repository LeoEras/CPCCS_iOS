//
//  Denuncias4Controller.swift
//  CPCCS App
//
//  Created by Leonardo on 4/3/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//

import UIKit

class Denuncias4Controller: UIViewController {

    @IBOutlet weak var nombre: UILabel!
    var denu = Denuncia.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = denu.getNombres()
        //DenunciasController.nombre
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
