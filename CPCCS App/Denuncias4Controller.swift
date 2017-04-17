//
//  Denuncias4Controller.swift
//  CPCCS App
//
//  Created by Leonardo on 4/3/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//
import UIKit

class Denuncias4Controller: UIViewController {
    var denuncia = DataHolder.shared
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var apellidos: UILabel!
    @IBOutlet weak var correo: UILabel!
    @IBOutlet weak var identificacion: UILabel!
    @IBOutlet weak var nombreDenunciado: UILabel!
    @IBOutlet weak var apellidoDenunciado: UILabel!
    @IBOutlet weak var descDenuncia: UITextView!
    
    @IBAction func sendAction(_ sender: Any) {
        var tipoIdent: String = ""
        var comparece: Bool = true
        var idenReservada: Bool = true
        var resExtranjero: Bool = true
        
        if(denuncia.getTipoIden() == 0){
            tipoIdent = "Cédula"
        } else if(denuncia.getTipoIden() == 1){
            tipoIdent = "RUC"
        } else if(denuncia.getTipoIden() == 2){
            tipoIdent = "Pasaporte"
        }
        
        if(denuncia.getIdentidad() == 1){
            idenReservada = false
        }
        
        if(denuncia.getComparece() == 1){
            comparece = false
        }
        
        if(denuncia.getReside() == 1){
            resExtranjero = false
        }
       
        let predenuncia = PreDenuncia(tipo: "0", genero1: String(denuncia.getGenero()), descripcion: denuncia.getMotivo(), genero2: String(denuncia.getGeneroDenunciado()), funcionario: "a", nivelEdu: denuncia.getNivEdu(), ocupacion: denuncia.getOcupacion(), nacionalidad: denuncia.getNacion(), estadoCivil: denuncia.getEstCivil(), institucionImpl: denuncia.getInstitucion())
        _ = CPCCSClient.sharedInstance().postToPreDenuncia(predenuncia) { (statusCode, error) in
            if let error = error {
                print(error)
            } else {
                if statusCode == 1 || statusCode == 12 || statusCode == 13 {
                    print("Done")
                } else {
                    print("Unexpected status code \(statusCode)")
                }
            }
        }
        
        let reclamo = Reclamo(nombApelDenunciante: denuncia.getNombres(), tipoIdentificacion: tipoIdent, numIdentificacion: denuncia.getIdentificacion(), direccion: denuncia.getDireccion(), email: denuncia.getCorreo(), nombApelDenunciado: denuncia.getNombresDenunciado(), telefono: denuncia.getTelefono(), cargo: denuncia.getCargo(), comparecer: comparece, documentores: false, identidadReservada: idenReservada, resideExtranjero: resExtranjero, ciudadDelDenunciante: denuncia.getCiudad(), ciudadDelDenunciado: denuncia.getCiudadDenunciado(), institucionImplicadaReclamo: denuncia.getInstitucion(), provinciaDenunciante: denuncia.getProvincia(), provinciaDenunciado: denuncia.getProvinciaDenunciado())
        CPCCSClient.sharedInstance().postToReclamo(reclamo) /*{ (statusCode, error) in
             if let error = error {
             print(error)
             } else {
             if statusCode == 1 || statusCode == 12 || statusCode == 13 {
             print("Done")
             } else {
             print("Unexpected status code \(statusCode)")
             // Si existe el id
             }
             }*/
            // Si la respuesta le retorna un id, significa que se inserto correctamente
        { (id, error) in
            if let error = error {
                print(error)
            } else {
                print("Reclamo insertado correctamente")
                print("Reclamo id: \(id)")
                self.performSegue(withIdentifier: "denunciaPostReturnMain", sender: self)
                // Colocar por aqui un self.present(ViewController, animated:true, nil)
                // o algun AlertView y retornar al menu principal
            }
        }
        //
    }
    
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
    
    @IBAction func backToMain(_ sender: UIButton) {
        // create the alert
        let alert = UIAlertController(title: "Denuncias", message: "¡Si retrocede se perderán los datos ingresados! ¿Desea regresar?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Sí", style: UIAlertActionStyle.default, handler: { action in
            self.denuncia.resetData()
            self.performSegue(withIdentifier: "d4m", sender: self)
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
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
