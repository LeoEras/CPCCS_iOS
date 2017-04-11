//
//  ViewController.swift
//  CPCCS App
//
//  Created by Leonardo on 3/15/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//

import UIKit

class Denuncias3Controller: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    var denuncia = Denuncia.shared
    
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var apellidosTextField: UITextField!
    @IBOutlet weak var institucionTextField: UITextField!
    @IBOutlet weak var cargoTextField: UITextField!
    @IBOutlet weak var cantPerTextField: UITextField!
    @IBOutlet weak var uniDirTextField: UITextField!
    
    @IBOutlet weak var generoShow: UILabel!
    @IBOutlet weak var generoSelector: UIPickerView!
    var generoOpciones = ["FEMENINO", "MASCULINO"]
    
    @IBOutlet weak var ocupacionShow: UILabel!
    var ocupacionOpciones = [""]
    var ocupacionID = [0]
    @IBOutlet weak var ocupacionSelector: UIPickerView!

    @IBOutlet weak var provShow: UILabel!
    @IBOutlet weak var provSelector: UIPickerView!
    var provOpciones = [""]
    var provID = [0]
    
    @IBOutlet weak var ciuShow: UILabel!
    @IBOutlet weak var ciuSelector: UIPickerView!
    var ciuOpciones = [""]
    var ciuID = [0]
    
    // MARK: Helper variables
    var institucion: Institucion?
    var cleared: Bool?
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Numero de filas en el picker View
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = 1
        if (pickerView == generoSelector){
            countrows = self.generoOpciones.count
        } else if (pickerView == ocupacionSelector){
            countrows = self.ocupacionOpciones.count
        } else if (pickerView == provSelector){
            countrows = self.provOpciones.count
        }  else if (pickerView == ciuSelector){
            countrows = self.ciuOpciones.count
        }
        return countrows
    }
    
    //Que va en cada fila del Picker View
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(denuncia.getTerceraVentana()) {
            if (pickerView == generoSelector){
                let titlerow = generoOpciones[row]
                generoShow.text = generoOpciones[denuncia.getGeneroDenunciado()]
                return titlerow
            }
        } else {
            if (pickerView == generoSelector){
                let titlerow = generoOpciones[row]
                return titlerow
            }
        }
        if (pickerView == generoSelector){
            let titlerow = generoOpciones[row]
            return titlerow
        } else if(pickerView == ocupacionSelector){
            let titlerow = ocupacionOpciones[row]
            return titlerow
        } else if(pickerView == provSelector){
            let titlerow = provOpciones[row]
            return titlerow
        }  else if(pickerView == ciuSelector){
            let titlerow = ciuOpciones[row]
            return titlerow
        }
        return ""
    }
    
    //Oculta el Picker View cuando una opcion es seleccionada
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == generoSelector){
            denuncia.setGeneroDenunciado(opcion: row)
            self.generoShow.text = self.generoOpciones[row]
            self.generoSelector.isHidden = true
        } else if (pickerView == ocupacionSelector){
            denuncia.setOcupacionDenunciado(opcion: row)
            self.ocupacionShow.text = self.ocupacionOpciones[row]
            self.ocupacionSelector.isHidden = true
        } else if (pickerView == provSelector){
            denuncia.setProvinciaDenunciado(opcion: row)
            self.provShow.text = self.provOpciones[row]
            self.getCiuidad(id: provID[row])
            self.provSelector.isHidden = true
        } else if (pickerView == ciuSelector){
            denuncia.setCiudadDenunciado(opcion: row)
            self.ciuShow.text = self.ciuOpciones[row]
            self.ciuSelector.isHidden = true
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == institucionTextField {
            if self.cleared! {
                self.cleared = false
                return false
            }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "InstitucionPickerViewController") as! InstitucionPickerViewController
            self.present(controller, animated: true, completion: nil)
            return false
            
        }
        return true
    }
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if textField == institucionTextField {
            self.cleared = true
            return true
        }
        return false
    }
    
    
    @IBAction func unwindToDenuncia(segue: UIStoryboardSegue){
        if let sourceViewController = segue.source as? InstitucionPickerViewController, let institucion = sourceViewController.institucion
        {
            DispatchQueue.main.async {
                self.institucionTextField.text = institucion.nombre
                self.institucion = institucion
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(denuncia.getTerceraVentana()){
            nombreTextField.text = denuncia.getNombresDenunciado()
            apellidosTextField.text = denuncia.getApellidosDenunciado()
            institucionTextField.text = denuncia.getInstitucionNombre()
            cargoTextField.text = denuncia.getCargoDenunciado()
            cantPerTextField.text = String(denuncia.getCantPerjudicados())
            uniDirTextField.text = denuncia.getUnidadDireccion()
            cargoTextField.text = denuncia.getCargoDenunciado()
        }
        
        self.cleared = false
        DispatchQueue.global(qos: .userInitiated).async { () -> Void in
            //Leyendo ocupacion
            let urlOcupaciones = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/ocupaciones")
            let task = URLSession.shared.dataTask(with: urlOcupaciones!) { (data, response, error) in
                self.ocupacionOpciones.remove(at: 0)
                self.ocupacionID.remove(at: 0)
                if error != nil {
                    print(error ?? "Error")
                } else {
                    if let content = data{
                        do {
                            let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            if let items = myJson["results"] as? NSArray {
                                for values in items {
                                    if let item = values as? NSDictionary {
                                        let nombre = item["nombre"] as! String
                                        self.ocupacionOpciones.append(nombre)
                                        let id = item["id"] as! Int
                                        self.ocupacionID.append(id)
                                    }
                                }
                                DispatchQueue.main.async {
                                    self.ocupacionSelector.isHidden = true
                                    self.ocupacionSelector.reloadAllComponents()
                                    if(self.denuncia.getTerceraVentana()){
                                        self.ocupacionShow.text = self.ocupacionOpciones[self.denuncia.getOcupacionDenunciado()]
                                    } else {
                                        self.ocupacionShow.text = self.ocupacionOpciones[0]
                                    }
                                }
                            }
                        } catch {
                        
                        }
                    }
                }
            }
            task.resume()
        }
        
        DispatchQueue.global(qos: .userInitiated).async { () -> Void in
            //Leyendo provincias
            let urlProvincias = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/provincias/?limit=30")
            let task1 = URLSession.shared.dataTask(with: urlProvincias!) { (data, response, error) in
                self.provOpciones.remove(at: 0)
                self.provID.remove(at: 0)
                if error != nil {
                    print(error ?? "Error")
                } else {
                    if let content = data{
                        do {
                            let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            if let items = myJson["results"] as? NSArray {
                                for values in items {
                                    if let item = values as? NSDictionary {
                                        let nombre = item["nombre"] as! String
                                        self.provOpciones.append(nombre)
                                        let id = item["id"] as! Int
                                        self.provID.append(id)
                                    }
                                }
                                DispatchQueue.main.async {
                                    self.provSelector.isHidden = true
                                    self.provSelector.reloadAllComponents()
                                    if(self.denuncia.getTerceraVentana()){
                                        self.provShow.text = self.provOpciones[self.denuncia.getProvinciaDenunciado()]
                                    } else {
                                        self.provShow.text = self.provOpciones[0]
                                    }
                                }
                            }
                        } catch {
                        
                        }
                    }
                }
                if(self.denuncia.getTerceraVentana()){
                    self.getCiuidad(id: self.provID[self.denuncia.getProvinciaDenunciado()])
                } else {
                    self.getCiuidad(id: self.provID[0])
                }
            }
            task1.resume()
        }
        
        // TextFields delegates assignment
        nombreTextField.delegate = self
        apellidosTextField.delegate = self
        institucionTextField.delegate = self
        cargoTextField.delegate = self
        cantPerTextField.delegate = self
        uniDirTextField.delegate = self
        
        attachTapHandler(label: generoShow)
        attachTapHandler(label: ocupacionShow)
        attachTapHandler(label: provShow)
        attachTapHandler(label: ciuShow)
    }
    
    func getCiuidad(id: Int){
        let urlCiudad = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/ciudades/?provincia=" + String(id))
        let task1 = URLSession.shared.dataTask(with: urlCiudad!) { (data, response, error) in
            self.ciuOpciones.removeAll()
            self.ciuID.removeAll()
            if error != nil {
                print(error ?? "Error")
            } else {
                if let content = data{
                    do {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        if let items = myJson["results"] as? NSArray {
                            for values in items {
                                if let item = values as? NSDictionary {
                                    let nombre = item["nombre"] as! String
                                    self.ciuOpciones.append(nombre)
                                    let id = item["id"] as! Int
                                    self.ciuID.append(id)
                                }
                            }
                            DispatchQueue.main.async {
                                self.ciuSelector.isHidden = true
                                self.ciuSelector.reloadAllComponents()
                                if(self.denuncia.getTerceraVentana()){
                                    self.ciuShow.text = self.ciuOpciones[self.denuncia.getCiudadDenunciado()]
                                } else {
                                    self.ciuShow.text = self.ciuOpciones[0]
                                }
                            }
                        }
                    } catch {
                        
                    }
                }
            }
        }
        task1.resume()
    }
    
    //Agrega el manejador de tap al label
    func attachTapHandler(label: UILabel)->Void{
        let tap = UITapGestureRecognizer(target: self, action: #selector(Denuncias3Controller.tapFunction))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
    }
    
    // MARK: TextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag: Int = textField.tag + 1
        
        let nextResponder: UIResponder? = textField.superview?.superview?.viewWithTag(nextTag)
        
        if let nextR = nextResponder
        {
            // Found next responder, so set it.
            nextR.becomeFirstResponder()
        }
        else
        {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        
        return false
    }
    
    func tapFunction(sender:UITapGestureRecognizer) {
        if(sender.view == generoShow){
            self.generoSelector.isHidden = false
        } else if(sender.view == ocupacionShow){
            self.ocupacionSelector.isHidden = false
        } else if(sender.view == provShow){
            self.provSelector.isHidden = false
        } else if(sender.view == ciuShow){
            self.ciuSelector.isHidden = false
        }
        hideAllKeyboards()
    }
    
    func hideAllKeyboards(){
        nombreTextField.resignFirstResponder()
        apellidosTextField.resignFirstResponder()
        institucionTextField.resignFirstResponder()
        cargoTextField.resignFirstResponder()
        cantPerTextField.resignFirstResponder()
        uniDirTextField.resignFirstResponder()
        nextView()
    }
    
    func nextView(){
        if(nombreTextField.text != "" && apellidosTextField.text != "" &&
            institucionTextField.text != "" && cargoTextField.text != "" &&
            cantPerTextField.text != "" && uniDirTextField.text != ""){
            denuncia.setNombresDenunciado(name: nombreTextField.text!)
            denuncia.setApellidosDenunciado(lname: apellidosTextField.text!)
            denuncia.setInstitucionNombre(iname: institucionTextField.text!)
            if(institucion?.id != nil){
                denuncia.setInstitucion(opcion: institucion!.id)
            }
            denuncia.setCargoDenunciado(string: cargoTextField.text!)
            denuncia.setCantPerjudicados(opcion: Int(cantPerTextField.text!)!)
            denuncia.setUnidadDireccion(string: uniDirTextField.text!)
            denuncia.setTerceraVentana(boolean: true)
        }
    }
}


