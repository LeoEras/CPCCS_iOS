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
    @IBOutlet weak var apellidos: UILabel!
    @IBOutlet weak var correo: UILabel!
    @IBOutlet weak var identificacion: UILabel!
    @IBOutlet weak var nombreDenunciado: UILabel!
    @IBOutlet weak var apellidoDenunciado: UILabel!
    @IBOutlet weak var descDenuncia: UITextView!
    
    var denuncia = Denuncia.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = denuncia.getNombres()
        apellidos.text = denuncia.getApellidos()
        correo.text = denuncia.getCorreo()
        identificacion.text = denuncia.getIdentificacion()
        nombreDenunciado.text = denuncia.getNombresDenunciado()
        apellidoDenunciado.text = denuncia.getApellidosDenunciado()
        descDenuncia.text = denuncia.getMotivo()

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
