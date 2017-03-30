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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
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
        }else if (pickerView == estCivilSelector){
            countrows = self.estCivilOpciones.count
        }
        return countrows
    }
    
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
        }
        return ""
    }
    
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
        }
    }
    
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
        }
    }
    
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
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*if let url = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/estados-civiles/") {
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
        }*/
        
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
        
        generoSelector.delegate = self
        
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
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
    }
    
}


