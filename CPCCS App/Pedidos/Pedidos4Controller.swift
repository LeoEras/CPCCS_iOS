//
//  Pedidos4Controller.swift
//  CPCCS App
//
//  Created by Leonardo on 4/3/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//
import UIKit

class Pedidos4Controller: UIViewController {
    var sent: Bool = false
    var pedido = DataHolder.shared
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var apellidos: UILabel!
    @IBOutlet weak var correo: UILabel!
    @IBOutlet weak var identificacion: UILabel!
    @IBOutlet weak var nombreEntidad: UILabel!
    @IBOutlet weak var apellidoEntidad: UILabel!
    @IBOutlet weak var descPedido: UITextView!
    
    @IBAction func postPedido(_ sender: UIButton) {
        var tipoIdent: String = ""
        var comparece: Bool = true
        var documentos: Bool = true
        var idenReservada: Bool = true
        var resExtranjero: Bool = true
        
        if(pedido.getTipoIden() == 0){
            tipoIdent = "Cédula"
        } else if(pedido.getTipoIden() == 1){
            tipoIdent = "RUC"
        } else if(pedido.getTipoIden() == 2){
            tipoIdent = "Pasaporte"
        }
        
        if(pedido.getIdentidad() == 1){
            idenReservada = false
        }
        
        if(pedido.getComparece() == 1){
            comparece = false
        }
        
        if(pedido.getDocumentos() == 1){
            documentos = false
        }
        
        if(pedido.getReside() == 1){
            resExtranjero = false
        }
        
        let predenuncia = PreDenuncia(tipo: "1", genero1: String(pedido.getGenero()), descripcion: pedido.getMotivo(), genero2: String(pedido.getGeneroDenunciado()), funcionario: "a", nivelEdu: pedido.getNivEdu(), ocupacion: pedido.getOcupacion(), nacionalidad: pedido.getNacion(), estadoCivil: pedido.getEstCivil(), institucionImpl: pedido.getInstitucion())
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
        
        let reclamo = Reclamo(nombApelDenunciante: pedido.getNombres() + " " + pedido.getApellidos(), tipoIdentificacion: tipoIdent, numIdentificacion: pedido.getIdentificacion(), direccion: pedido.getDireccion(), email: pedido.getCorreo(), nombApelDenunciado: pedido.getNombresDenunciado() + " " + pedido.getApellidosDenunciado(), telefono: pedido.getTelefono(), cargo: pedido.getCargo(), comparecer: comparece, documentores: documentos, identidadReservada: idenReservada, resideExtranjero: resExtranjero, ciudadDelDenunciante: pedido.getCiudad(), ciudadDelDenunciado: pedido.getCiudadDenunciado(), institucionImplicadaReclamo: pedido.getInstitucion(), provinciaDenunciante: pedido.getProvincia(), provinciaDenunciado: pedido.getProvinciaDenunciado())
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
                let alert = UIAlertController(title: "Pedidos", message: "Error al intentar enviar el pedido, intente más tarde", preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: { action in
                    self.pedido.resetData()
                    self.performSegue(withIdentifier: "postPedido", sender: self)
                }))
                self.present(alert, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Pedidos", message: "Pedido enviado con éxito", preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: { action in
                    self.pedido.resetData()
                    self.performSegue(withIdentifier: "postPedido", sender: self)
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = pedido.getNombres()
        apellidos.text = pedido.getApellidos()
        correo.text = pedido.getCorreo()
        identificacion.text = pedido.getIdentificacion()
        nombreEntidad.text = pedido.getNombresDenunciado()
        apellidoEntidad.text = pedido.getApellidosDenunciado()
        descPedido.text = pedido.getMotivo()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToMain(_ sender: UIButton) {
        // create the alert
        let alert = UIAlertController(title: "Pedidos", message: "¡Si retrocede se perderán los datos ingresados! ¿Desea regresar?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Sí", style: UIAlertActionStyle.default, handler: { action in
            self.pedido.resetData()
            self.performSegue(withIdentifier: "p4m", sender: self)
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
