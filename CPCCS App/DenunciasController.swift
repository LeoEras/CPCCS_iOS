//
//  ViewController.swift
//  CPCCS App
//
//  Created by Leonardo on 3/15/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//

import UIKit

class DenunciasController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var apellidosTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var edadTextField: UITextField!
    @IBOutlet weak var identidadShow: UITextField!
    
    @IBOutlet weak var identidadSelector: UIPickerView!
    
    @IBOutlet weak var organizacionTextField: UITextField!
    @IBOutlet weak var direccionTextField: UITextField!
    @IBOutlet weak var telefonoTextField: UITextField!
    var identidadOpciones = ["SI", "NO"]
    
    @IBOutlet weak var empleadoShow: UITextField!
    
    var empleadoOpciones = ["EMPLEADO PUBLICO", "EMPLEADO PRIVADO"]
    
    @IBOutlet weak var identificacionTextField: UITextField!
    @IBOutlet weak var cargoTextField: UITextField!
    @IBOutlet weak var empleadoSelector: UIPickerView!
    
    @IBOutlet weak var tipoIdentShow: UITextField!
    @IBOutlet weak var tipoIdentSelector: UIPickerView!
    var tipoIdentOpciones = ["CEDULA", "RUC", "PASAPORTE"]
    
    @IBOutlet weak var generoShow: UITextField!
    @IBOutlet weak var generoSelector: UIPickerView!
    var generoOpciones = ["FEMENINO", "MASCULINO"]
    
    @IBOutlet weak var estCivilShow: UITextField!
    @IBOutlet weak var estCivilSelector: UIPickerView!
    var estCivilOpciones = [""]
    
    @IBOutlet weak var nivEduShow: UITextField!
    @IBOutlet weak var nivEduSelector: UIPickerView!
    var nivEduOpciones = [""]
    
    @IBOutlet weak var nacionShow: UITextField!
    @IBOutlet weak var nacionSelector: UIPickerView!
    var nacionOpciones = [""]
    
    @IBOutlet weak var resideShow: UITextField!
    @IBOutlet weak var resideSelector: UIPickerView!
    var resideOpciones = ["SI", "NO"]
    
    @IBOutlet weak var provShow: UITextField!
    @IBOutlet weak var provSelector: UIPickerView!
    var provOpciones = [""]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBOutlet weak var aaa: UILabel!
    //Numero de filas en el picker View
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = 1
        if (pickerView == identidadSelector){
            countrows = self.identidadOpciones.count
        } else if (pickerView == empleadoSelector){
            countrows = self.empleadoOpciones.count
        } else if (pickerView == tipoIdentSelector){
            countrows = self.tipoIdentOpciones.count
        } else if (pickerView == generoSelector){
            countrows = self.generoOpciones.count
        } else if (pickerView == estCivilSelector){
            countrows = self.estCivilOpciones.count
        } else if (pickerView == nivEduSelector){
            countrows = self.nivEduOpciones.count
        } else if (pickerView == nacionSelector){
            countrows = self.nacionOpciones.count
        } else if (pickerView == resideSelector){
            countrows = self.resideOpciones.count
        }
        return countrows
    }
    
    //Que va en cada fila del Picker View
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == identidadSelector){
            let titlerow = identidadOpciones[row]
            return titlerow
        } else if(pickerView == empleadoSelector){
            let titlerow = empleadoOpciones[row]
            return titlerow
        } else if(pickerView == tipoIdentSelector){
            let titlerow = tipoIdentOpciones[row]
            return titlerow
        } else if(pickerView == generoSelector){
            let titlerow = generoOpciones[row]
            return titlerow
        } else if(pickerView == estCivilSelector){
            let titlerow = estCivilOpciones[row]
            return titlerow
        } else if(pickerView == nivEduSelector){
            let titlerow = nivEduOpciones[row]
            return titlerow
        } else if(pickerView == nacionSelector){
            let titlerow = nacionOpciones[row]
            return titlerow
        } else if(pickerView == resideSelector){
            let titlerow = resideOpciones[row]
            return titlerow
        }
        return ""
    }
    
    //Oculta el Picker View cuando una opcion es seleccionada
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == identidadSelector){
            self.identidadShow.text = self.identidadOpciones[row]
            self.identidadSelector.isHidden = true
        } else if (pickerView == empleadoSelector){
            self.empleadoShow.text = self.empleadoOpciones[row]
            self.empleadoSelector.isHidden = true
        } else if (pickerView == tipoIdentSelector){
            self.tipoIdentShow.text = self.tipoIdentOpciones[row]
            self.tipoIdentSelector.isHidden = true
        } else if (pickerView == generoSelector){
            self.generoShow.text = self.generoOpciones[row]
            self.generoSelector.isHidden = true
        } else if (pickerView == estCivilSelector){
            self.estCivilShow.text = self.estCivilOpciones[row]
            self.estCivilSelector.isHidden = true
        } else if (pickerView == nivEduSelector){
            self.nivEduShow.text = self.nivEduOpciones[row]
            self.nivEduSelector.isHidden = true
        } else if (pickerView == nacionSelector){
            self.nacionShow.text = self.nacionOpciones[row]
            self.nacionSelector.isHidden = true
        } else if (pickerView == resideSelector){
            self.resideShow.text = self.resideOpciones[row]
            self.resideSelector.isHidden = true
        }
    }
    
    //Al seleccionar un textfield
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if (textField == identidadShow){
            self.identidadSelector.isHidden = false
        } else if (textField == empleadoShow){
            self.empleadoSelector.isHidden = false
        } else if (textField == tipoIdentShow){
            self.tipoIdentSelector.isHidden = false
        } else if (textField == generoShow){
            self.generoSelector.isHidden = false
        } else if (textField == estCivilShow){
            self.estCivilSelector.isHidden = false
        } else if (textField == nivEduShow){
            self.nivEduSelector.isHidden = false
        } else if (textField == nacionShow){
            self.nacionSelector.isHidden = false
        } else if (textField == resideShow){
            self.resideSelector.isHidden = false
        }
    }
    
    //Al dejar de seleccionar el textfield
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField == identidadShow){
            self.identidadSelector.isHidden = true
        } else if (textField == empleadoShow){
            self.empleadoSelector.isHidden = true
        } else if (textField == tipoIdentShow){
            self.tipoIdentSelector.isHidden = true
        } else if (textField == generoShow){
            self.generoSelector.isHidden = true
        } else if (textField == estCivilShow){
            self.estCivilSelector.isHidden = true
        } else if (textField == nivEduShow){
            self.nivEduSelector.isHidden = true
        } else if (textField == nacionShow){
            self.nacionSelector.isHidden = true
        } else if (textField == resideShow){
            self.resideSelector.isHidden = true
        }
    }
    
    /*func readFromURL(url: String, opciones: Array<String>) -> Void{
        if let data = URL(string: url) {
            do {
                let info = try String(contentsOf: data)
                let infoDepurado = info.components(separatedBy: "\"")
                
                opciones.remove(at: 0)
                opciones.append(infoDepurado[11])
                opciones.append(infoDepurado[17])
                opciones.append(infoDepurado[23])
                opciones.append(infoDepurado[29])
                opciones.append(infoDepurado[35])
                
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let url = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/estados-civiles/") {
            do {
                let estCivilOnline = try String(contentsOf: url)
                let estCivilDepurado = estCivilOnline.components(separatedBy: "\"")
                
                estCivilOpciones.remove(at: 0)
                estCivilOpciones.append(estCivilDepurado[11])
                estCivilOpciones.append(estCivilDepurado[17])
                estCivilOpciones.append(estCivilDepurado[23])
                estCivilOpciones.append(estCivilDepurado[29])
                estCivilOpciones.append(estCivilDepurado[35])

            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
        
        if let url = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/niveles-educacion/") {
            do {
                let nivEduOnline = try String(contentsOf: url)
                let nivEduDepurado = nivEduOnline.components(separatedBy: "\"")
                
                nivEduOpciones.remove(at: 0)
                nivEduOpciones.append(nivEduDepurado[11])
                nivEduOpciones.append(nivEduDepurado[19])
                nivEduOpciones.append(nivEduDepurado[27])
                nivEduOpciones.append(nivEduDepurado[35])
                
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
        
        if let url = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/nacionalidades/") {
            do {
                let nacionOnline = try String(contentsOf: url)
                let nacionDepurado = nacionOnline.components(separatedBy: "\"")
                
                nacionOpciones.remove(at: 0)
                nacionOpciones.append(nacionDepurado[11])
                nacionOpciones.append(nacionDepurado[17])
 
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
        
        
        if let url = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/provincias/?limit=30&offset=0") {
            do {
                let provOnline = try String(contentsOf: url)
                let provDepurado = provOnline.components(separatedBy: "\"")
                
                print(provDepurado[11])
                print(provDepurado[17])
                print(provDepurado[23])
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
        
        // TextFields delegates assignment
        nombreTextField.delegate = self
        apellidosTextField.delegate = self
        edadTextField.delegate = self
        emailTextField.delegate = self
        telefonoTextField.delegate = self
        direccionTextField.delegate = self
        organizacionTextField.delegate = self
        identificacionTextField.delegate = self
        cargoTextField.delegate = self
        
        //generoSelector.delegate = self
        
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
    
    //func textFieldDidEndEditing(_ textField: UITextField, //reason: UITextFieldDidEndEditingReason) {
    //}
    
}


