//
//  ViewController.swift
//  CPCCS App
//
//  Created by Leonardo on 3/15/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//

import UIKit

class DenunciasController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    var denuncia = Denuncia.shared
    
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var apellidosTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var edadTextField: UITextField!
    
    @IBOutlet weak var idenShow: UILabel!
    @IBOutlet weak var identidadSelector: UIPickerView!
    var identidadOpciones = ["SI", "NO"]
    
    @IBOutlet weak var organizacionTextField: UITextField!
    @IBOutlet weak var direccionTextField: UITextField!
    @IBOutlet weak var telefonoTextField: UITextField!
    
    @IBOutlet weak var empleadoShow: UILabel!
    var empleadoOpciones = [""]
    var empleadoID = [0]
    @IBOutlet weak var empleadoSelector: UIPickerView!
    
    @IBOutlet weak var identificacionTextField: UITextField!
    @IBOutlet weak var cargoTextField: UITextField!
    
    @IBOutlet weak var tipoIdentShow: UILabel!
    @IBOutlet weak var tipoIdentSelector: UIPickerView!
    var tipoIdentOpciones = ["CEDULA", "RUC", "PASAPORTE"]
    
    @IBOutlet weak var generoShow: UILabel!
    @IBOutlet weak var generoSelector: UIPickerView!
    var generoOpciones = ["FEMENINO", "MASCULINO"]
    
    @IBOutlet weak var estCivilShow: UILabel!
    @IBOutlet weak var estCivilSelector: UIPickerView!
    var estCivilOpciones = [""]
    var estCivilID = [0]
    
    @IBOutlet weak var nivEduShow: UILabel!
    @IBOutlet weak var nivEduSelector: UIPickerView!
    var nivEduOpciones = [""]
    var nivEduID = [0]
    
    @IBOutlet weak var nacionShow: UILabel!
    @IBOutlet weak var nacionSelector: UIPickerView!
    var nacionOpciones = [""]
    var nacionID = [0]
    
    @IBOutlet weak var resideShow: UILabel!
    @IBOutlet weak var resideSelector: UIPickerView!
    var resideOpciones = ["SI", "NO"]
    
    @IBOutlet weak var provShow: UILabel!
    @IBOutlet weak var provSelector: UIPickerView!
    var provOpciones = [""]
    var provID = [0]
    
    @IBOutlet weak var ciuShow: UILabel!
    @IBOutlet weak var ciuSelector: UIPickerView!
    var ciuOpciones = [""]
    var ciuID = [0]
    
    var institucion: Institucion?
    
    var cleared: Bool?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
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
        } else if (pickerView == provSelector){
            countrows = self.provOpciones.count
        }  else if (pickerView == ciuSelector){
            countrows = self.ciuOpciones.count
        }
        return countrows
    }
    
    //Que va en cada fila del Picker View
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if(denuncia.getPrimeraVentana()){
            if(pickerView == identidadSelector){
                let titlerow = identidadOpciones[row]
                idenShow.text = identidadOpciones[denuncia.getIdentidad()]
                return titlerow
            } else if(pickerView == empleadoSelector){
                let titlerow = empleadoOpciones[row]
                empleadoShow.text = empleadoOpciones[denuncia.getOcupacion()]
                return titlerow
            } else if(pickerView == tipoIdentSelector){
                let titlerow = tipoIdentOpciones[row]
                tipoIdentShow.text = tipoIdentOpciones[denuncia.getTipoIden()]
                return titlerow
            } else if(pickerView == generoSelector){
                let titlerow = generoOpciones[row]
                generoShow.text = generoOpciones[denuncia.getGenero()]
                return titlerow
            } else if(pickerView == resideSelector){
                let titlerow = resideOpciones[row]
                resideShow.text = resideOpciones[denuncia.getReside()]
                return titlerow
            }
        } else {
            if(pickerView == identidadSelector){
                denuncia.setIdentidad(opcion: row)
                let titlerow = identidadOpciones[row]
                return titlerow
            } else if(pickerView == empleadoSelector){
                denuncia.setOcupacion(opcion: row)
                let titlerow = empleadoOpciones[row]
                return titlerow
            } else if(pickerView == tipoIdentSelector){
                denuncia.setTipoIden(opcion: row)
                let titlerow = tipoIdentOpciones[row]
                return titlerow
            } else if(pickerView == generoSelector){
                denuncia.setGenero(opcion: row)
                let titlerow = generoOpciones[row]
                return titlerow
            } else if(pickerView == resideSelector){
                denuncia.setReside(opcion: row)
                let titlerow = resideOpciones[row]
                return titlerow
            }
        }
        
        if(pickerView == estCivilSelector){
            //denuncia.setEstCivil(opcion: row)
            let titlerow = estCivilOpciones[row]
            return titlerow
        } else if(pickerView == nivEduSelector){
            //denuncia.setNivEdu(opcion: row)
            let titlerow = nivEduOpciones[row]
            return titlerow
        } else if(pickerView == nacionSelector){
            //denuncia.setNacion(opcion: row)
            let titlerow = nacionOpciones[row]
            return titlerow
        } else if(pickerView == provSelector){
            //denuncia.setProvincia(opcion: row)
            let titlerow = provOpciones[row]
            return titlerow
        } else if(pickerView == ciuSelector){
            //enuncia.setCiudad(opcion: row)
            let titlerow = ciuOpciones[row]
            return titlerow
        }
        return ""
    }
    
    //Oculta el Picker View cuando una opcion es seleccionada
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == identidadSelector){
            denuncia.setIdentidad(opcion: row)
            self.idenShow.text = self.identidadOpciones[row]
            self.identidadSelector.isHidden = true
        } else if (pickerView == empleadoSelector){
            denuncia.setOcupacion(opcion: row)
            self.empleadoShow.text = self.empleadoOpciones[row]
            self.empleadoSelector.isHidden = true
        } else if (pickerView == tipoIdentSelector){
            denuncia.setTipoIden(opcion: row)
            self.tipoIdentShow.text = self.tipoIdentOpciones[row]
            self.tipoIdentSelector.isHidden = true
        } else if (pickerView == generoSelector){
            denuncia.setGenero(opcion: row)
            self.generoShow.text = self.generoOpciones[row]
            self.generoSelector.isHidden = true
        } else if (pickerView == estCivilSelector){
            denuncia.setEstCivil(opcion: row)
            self.estCivilShow.text = self.estCivilOpciones[row]
            self.estCivilSelector.isHidden = true
        } else if (pickerView == nivEduSelector){
            denuncia.setNivEdu(opcion: row)
            self.nivEduShow.text = self.nivEduOpciones[row]
            self.nivEduSelector.isHidden = true
        } else if (pickerView == nacionSelector){
            denuncia.setNacion(opcion: row)
            self.nacionShow.text = self.nacionOpciones[row]
            self.nacionSelector.isHidden = true
        } else if (pickerView == resideSelector){
            denuncia.setReside(opcion: row)
            self.resideShow.text = self.resideOpciones[row]
            self.resideSelector.isHidden = true
        } else if (pickerView == provSelector){
            denuncia.setProvincia(opcion: row)
            self.provShow.text = self.provOpciones[row]
            self.getCiuidad(id: provID[row])
            self.provSelector.isHidden = true
        } else if (pickerView == ciuSelector){
            denuncia.setCiudad(opcion: row)
            self.ciuShow.text = self.ciuOpciones[row]
            self.ciuSelector.isHidden = true
        }
    }
    
    // MARK: Textfield
    //Al dejar de seleccionar el textfield
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func checkEmail(candidate: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: candidate)
    }
    
    func checkTextNumber(text: String) -> Bool {
        let regex = "[A-Za-zá-ú]+"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }
    
    func checkLength(text: String) -> Bool {
        let regex = "[A-Za-zá-ú]{1,24}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }
    
    func checkOnlyNumbers(text: String) -> Bool {
        let regex = "[0-9]+"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }
    func checkIdentificacionLength(text: String) -> Bool {
        let regex = "[0-9]{10,11}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }
    func checkTelefonoLength(text: String) -> Bool {
        let regex = "[0-9]{7,12}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }
    
    func checkEdadLength(text: String) -> Bool {
        let regex = "[0-9]{1,3}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }
    
    func changeTextFieldColor(value: Bool, textField: UITextField) {
        if (!value){
            textField.layer.borderColor = UIColor.red.cgColor
            textField.textColor = UIColor.red
        } else {
            textField.layer.borderColor = UIColor.black.cgColor
            textField.textColor = UIColor.black
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        if textField == nombreTextField {
            let existOrNotNumber = checkTextNumber(text: newString)
            changeTextFieldColor(value: existOrNotNumber, textField: nombreTextField)
        } else if textField == apellidosTextField {
            let existOrNotNumber = checkTextNumber(text: newString)
            changeTextFieldColor(value: existOrNotNumber, textField: apellidosTextField)
        } else if textField == emailTextField {
            let emailValidated = checkEmail(candidate: newString)
            changeTextFieldColor(value: emailValidated, textField: emailTextField)
        } else if textField == edadTextField {
            let onlyNumbers = checkOnlyNumbers(text: newString)
            changeTextFieldColor(value: onlyNumbers, textField: edadTextField)
            let length = checkEdadLength(text: newString)
            changeTextFieldColor(value: length, textField: edadTextField)
            
        } else if textField == telefonoTextField {
            let onlyNumbers = checkOnlyNumbers(text: newString)
            changeTextFieldColor(value: onlyNumbers, textField: telefonoTextField)
            let length = checkTelefonoLength(text: newString)
            changeTextFieldColor(value: length, textField: telefonoTextField)
            
        } else if textField == direccionTextField {
            
        } else if textField == identificacionTextField {
            let onlyNumbers = checkOnlyNumbers(text: newString)
            changeTextFieldColor(value: onlyNumbers, textField: identificacionTextField)
            let length = checkIdentificacionLength(text: newString)
            changeTextFieldColor(value: length, textField: identificacionTextField)
            
        } else if textField == cargoTextField {
            let existOrNotNumber = checkTextNumber(text: newString)
            changeTextFieldColor(value: existOrNotNumber, textField: cargoTextField)
            let length = checkIdentificacionLength(text: newString)
            changeTextFieldColor(value: length, textField: cargoTextField)
            
        }
        
        return true
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
        denuncia.setNombres(name: nombreTextField.text!)
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cleared = false
        
        //Caso en que la ventana ya haya sido completada
        if(denuncia.getPrimeraVentana()){
            nombreTextField.text = denuncia.getNombres()
            apellidosTextField.text = denuncia.getApellidos()
            edadTextField.text = String(denuncia.getEdad())
            emailTextField.text = denuncia.getCorreo()
            telefonoTextField.text = denuncia.getTelefono()
            direccionTextField.text = denuncia.getDireccion()
            organizacionTextField.text = denuncia.getOrgSocial()
            identificacionTextField.text = denuncia.getIdentificacion()
            cargoTextField.text = denuncia.getCargo()
        }
        
        //Leyendo estados civiles
        DispatchQueue.global(qos: .userInitiated).async { () -> Void in
            let urlEstCivil = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/estados-civiles/")
            let task = URLSession.shared.dataTask(with: urlEstCivil!) { (data, response, error) in
                self.estCivilOpciones.remove(at: 0)
                self.estCivilID.remove(at: 0)
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
                                        self.estCivilOpciones.append(nombre)
                                        let id = item["id"] as! Int
                                        self.estCivilID.append(id)
                                    }
                                }
                                DispatchQueue.main.async {
                                    self.estCivilSelector.isHidden = true
                                    self.estCivilSelector.reloadAllComponents()
                                    if(self.denuncia.getPrimeraVentana()){
                                        self.estCivilShow.text = self.estCivilOpciones[self.denuncia.getEstCivil()]
                                    } else {
                                        self.estCivilShow.text = self.estCivilOpciones[0]
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
        
        //Leyendo provincias
        DispatchQueue.global(qos: .userInitiated).async { () -> Void in
            let urlProvincias = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/provincias/?limit=30")
            let task = URLSession.shared.dataTask(with: urlProvincias!) { (data, response, error) in
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
                                    if(self.denuncia.getPrimeraVentana()){
                                        self.provShow.text = self.provOpciones[self.denuncia.getProvincia()]
                                    } else {
                                        self.provShow.text = self.provOpciones[0]
                                    }
                                }
                            }
                        } catch {
                        
                        }
                    }
                }
                if(self.denuncia.getPrimeraVentana()){
                    self.getCiuidad(id: self.provID[self.denuncia.getProvincia()])
                } else {
                    self.getCiuidad(id: self.provID[0])
                }
            }
            task.resume()
        }
        
        //get Niveles de educacion
        DispatchQueue.global(qos: .userInitiated).async { () -> Void in
            let urlNivEdu = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/niveles-educacion/")
            let task = URLSession.shared.dataTask(with: urlNivEdu!) { (data, response, error) in
                self.nivEduOpciones.remove(at: 0)
                self.nivEduID.remove(at: 0)
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
                                        self.nivEduOpciones.append(nombre)
                                        let id = item["id"] as! Int
                                        self.nivEduID.append(id)
                                    }
                                }
                                DispatchQueue.main.async {
                                    self.nivEduSelector.isHidden = true
                                    self.nivEduSelector.reloadAllComponents()
                                    if(self.denuncia.getPrimeraVentana()){
                                        self.nivEduShow.text = self.nivEduOpciones[self.denuncia.getNivEdu()]
                                    } else {
                                        self.nivEduShow.text = self.nivEduOpciones[0]
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
        
        //get nacionalidades
        DispatchQueue.global(qos: .userInitiated).async { () -> Void in
            let urlNac = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/nacionalidades/")
            let task = URLSession.shared.dataTask(with: urlNac!) { (data, response, error) in
                self.nacionOpciones.remove(at: 0)
                self.nacionID.remove(at: 0)
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
                                        self.nacionOpciones.append(nombre)
                                        let id = item["id"] as! Int
                                        self.nacionID.append(id)
                                    }
                                }
                                DispatchQueue.main.async {
                                    self.nacionSelector.isHidden = true
                                    self.nacionSelector.reloadAllComponents()
                                    if(self.denuncia.getPrimeraVentana()){
                                        self.nacionShow.text = self.nacionOpciones[self.denuncia.getNacion()]
                                    } else {
                                        self.nacionShow.text = self.nacionOpciones[0]
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
            //Leyendo ocupacion
            let urlOcupaciones = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/ocupaciones")
            let task = URLSession.shared.dataTask(with: urlOcupaciones!) { (data, response, error) in
                self.empleadoOpciones.remove(at: 0)
                self.empleadoID.remove(at: 0)
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
                                        self.empleadoOpciones.append(nombre)
                                        let id = item["id"] as! Int
                                        self.empleadoID.append(id)
                                    }
                                }
                                DispatchQueue.main.async {
                                    self.empleadoSelector.isHidden = true
                                    self.empleadoSelector.reloadAllComponents()
                                    if(self.denuncia.getPrimeraVentana()){
                                        self.empleadoShow.text = self.empleadoOpciones[self.denuncia.getOcupacion()]
                                    } else {
                                        self.empleadoShow.text = self.empleadoOpciones[0]
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
        
        attachTapHandler(label: idenShow)
        attachTapHandler(label: empleadoShow)
        attachTapHandler(label: tipoIdentShow)
        attachTapHandler(label: estCivilShow)
        attachTapHandler(label: generoShow)
        attachTapHandler(label: nivEduShow)
        attachTapHandler(label: empleadoShow)
        attachTapHandler(label: resideShow)
        attachTapHandler(label: nacionShow)
        attachTapHandler(label: provShow)
        attachTapHandler(label: ciuShow)
        //generoSelector.delegate = self
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
                                if(self.denuncia.getPrimeraVentana()){
                                    self.ciuShow.text = self.ciuOpciones[self.denuncia.getCiudad()]
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
        let tap = UITapGestureRecognizer(target: self, action: #selector(DenunciasController.tapFunction))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
    }
    
    func tapFunction(sender:UITapGestureRecognizer) {
        if(sender.view == idenShow){
            self.identidadSelector.isHidden = false
        } else if(sender.view == empleadoShow){
            self.empleadoSelector.isHidden = false
        } else if(sender.view == tipoIdentShow){
            self.tipoIdentSelector.isHidden = false
        } else if(sender.view == generoShow){
            self.generoSelector.isHidden = false
        } else if(sender.view == estCivilShow){
            self.estCivilSelector.isHidden = false
        } else if(sender.view == nivEduShow){
            self.nivEduSelector.isHidden = false
        } else if(sender.view == resideShow){
            self.resideSelector.isHidden = false
        } else if(sender.view == nacionShow){
            self.nacionSelector.isHidden = false
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
        edadTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        telefonoTextField.resignFirstResponder()
        direccionTextField.resignFirstResponder()
        organizacionTextField.resignFirstResponder()
        identificacionTextField.resignFirstResponder()
        cargoTextField.resignFirstResponder()
        nextView()
    }
    
    func nextView(){
        if(nombreTextField.text != "" && apellidosTextField.text != "" &&
            edadTextField.text != "" && emailTextField.text != "" &&
            telefonoTextField.text != "" && direccionTextField.text != "" &&
            organizacionTextField.text != "" && identificacionTextField.text != "" &&
            cargoTextField.text != ""){
            denuncia.setNombres(name: nombreTextField.text!)
            denuncia.setApellidos(lname: apellidosTextField.text!)
            denuncia.setEdad(age: Int(edadTextField.text!)!)
            denuncia.setCorreo(email: emailTextField.text!)
            denuncia.setTelefono(phone: telefonoTextField.text!)
            denuncia.setDireccion(address: direccionTextField.text!)
            denuncia.setOrgSocial(social: organizacionTextField.text!)
            denuncia.setIdentificacion(identification: identificacionTextField.text!)
            denuncia.setCargo(position: cargoTextField.text!)
            denuncia.setPrimeraVentana(boolean: true)
        }
    }
    
}


