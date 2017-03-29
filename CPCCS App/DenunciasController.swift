//
//  ViewController.swift
//  CPCCS App
//
//  Created by Leonardo on 3/15/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//

import UIKit

class DenunciasController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var identidadShow: UITextField!
    
    @IBOutlet weak var identidadSelector: UIPickerView!
    
    var identidadOpciones = ["SI", "NO"]
    
    @IBOutlet weak var empleadoShow: UITextField!
    
    var empleadoOpciones = ["EMPLEADO PUBLICO", "EMPLEADO PRIVADO"]
    
    @IBOutlet weak var empleadoSelector: UIPickerView!
    
    @IBOutlet weak var tipoIdentShow: UITextField!
    
    @IBOutlet weak var tipoIdentSelector: UIPickerView!
    
    var tipoIdentOpciones = ["CEDULA", "RUC", "PASAPORTE"]
    
    @IBOutlet weak var generoShow: UITextField!
    
    @IBOutlet weak var generoSelector: UIPickerView!
    
    var generoOpciones = ["FEMENINO", "MASCULINO"]
    
    @IBOutlet weak var estCivilShow: UITextField!
    
    @IBOutlet weak var estCivilSelector: UIPickerView!
    
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
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}


