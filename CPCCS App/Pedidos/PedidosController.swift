//
//  PedidosController.swift
//  CPCCS App
//
//  Created by Leonardo on 3/15/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//

import UIKit

class PedidosController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIPopoverPresentationControllerDelegate {
    var pedido = DataHolder.shared
    
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
        //Caso en que la ventana ya haya sido completada antes
        if(pedido.getPrimeraVentana()){
            if(pickerView == identidadSelector){
                let titlerow = identidadOpciones[row]
                idenShow.text = identidadOpciones[pedido.getIdentidad()]
                return titlerow
            } else if(pickerView == tipoIdentSelector){
                let titlerow = tipoIdentOpciones[row]
                tipoIdentShow.text = tipoIdentOpciones[pedido.getTipoIden()]
                return titlerow
            } else if(pickerView == generoSelector){
                let titlerow = generoOpciones[row]
                generoShow.text = generoOpciones[pedido.getGenero()]
                return titlerow
            } else if(pickerView == resideSelector){
                let titlerow = resideOpciones[row]
                resideShow.text = resideOpciones[pedido.getReside()]
                return titlerow
            }
        } else { //Caso contrario
            if(pickerView == identidadSelector){
                pedido.setIdentidad(opcion: row)
                let titlerow = identidadOpciones[row]
                return titlerow
            } else if(pickerView == tipoIdentSelector){
                pedido.setTipoIden(opcion: row)
                let titlerow = tipoIdentOpciones[row]
                return titlerow
            } else if(pickerView == generoSelector){
                pedido.setGenero(opcion: row)
                let titlerow = generoOpciones[row]
                return titlerow
            } else if(pickerView == resideSelector){
                pedido.setReside(opcion: row)
                let titlerow = resideOpciones[row]
                return titlerow
            }
        }
        
        if(pickerView == estCivilSelector){
            //pedido.setEstCivil(opcion: row)
            let titlerow = estCivilOpciones[row]
            return titlerow
        } else if(pickerView == nivEduSelector){
            //pedido.setNivEdu(opcion: row)
            let titlerow = nivEduOpciones[row]
            return titlerow
        } else if(pickerView == empleadoSelector){
            let titlerow = empleadoOpciones[row]
            return titlerow
        } else if(pickerView == nacionSelector){
            //pedido.setNacion(opcion: row)
            let titlerow = nacionOpciones[row]
            return titlerow
        } else if(pickerView == provSelector){
            //pedido.setProvincia(opcion: row)
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
            pedido.setIdentidad(opcion: row)
            self.idenShow.text = self.identidadOpciones[row]
            self.identidadSelector.isHidden = true
        } else if (pickerView == empleadoSelector){
            pedido.setOcupacion(opcion: empleadoID[row])
            self.empleadoShow.text = self.empleadoOpciones[row]
            self.empleadoSelector.isHidden = true
        } else if (pickerView == tipoIdentSelector){
            pedido.setTipoIden(opcion: row)
            self.tipoIdentShow.text = self.tipoIdentOpciones[row]
            self.tipoIdentSelector.isHidden = true
        } else if (pickerView == generoSelector){
            pedido.setGenero(opcion: row)
            self.generoShow.text = self.generoOpciones[row]
            self.generoSelector.isHidden = true
        } else if (pickerView == estCivilSelector){
            pedido.setEstCivil(opcion: estCivilID[row])
            self.estCivilShow.text = self.estCivilOpciones[row]
            self.estCivilSelector.isHidden = true
        } else if (pickerView == nivEduSelector){
            pedido.setNivEdu(opcion: nivEduID[row])
            self.nivEduShow.text = self.nivEduOpciones[row]
            self.nivEduSelector.isHidden = true
        } else if (pickerView == nacionSelector){
            pedido.setNacion(opcion: nacionID[row])
            self.nacionShow.text = self.nacionOpciones[row]
            self.nacionSelector.isHidden = true
        } else if (pickerView == resideSelector){
            pedido.setReside(opcion: row)
            self.resideShow.text = self.resideOpciones[row]
            self.resideSelector.isHidden = true
        } else if (pickerView == provSelector){
            pedido.setProvincia(opcion: provID[row])
            self.provShow.text = self.provOpciones[row]
            self.searchCiudad(id: provID[row])
            self.provSelector.isHidden = true
        } else if (pickerView == ciuSelector){
            if(ciuOpciones.count != 0){
                pedido.setCiudad(opcion: ciuID[row])
                self.ciuShow.text = self.ciuOpciones[row]
                self.ciuSelector.isHidden = true
            }
        }
    }
    
    // MARK: Textfield
    //Al dejar de seleccionar el textfield
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    //Regex para email
    func checkEmail(candidate: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: candidate)
    }
    
    //Regex para texto
    func checkTextNumber(text: String) -> Bool {
        let regex = "[A-Za-zá-ú ]+"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }
    
    //Control de longitud de caracteres
    func checkLength(text: String) -> Bool {
        let regex = "[A-Za-zá-ú ]{1,24}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }
    
    //Regex para entradas de texto numericas
    func checkOnlyNumbers(text: String) -> Bool {
        let regex = "[0-9]+"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }
    
    //Regex para identificacion (Cedula, RUC, pasaporte)
    func checkIdentificacionLength(text: String) -> Bool {
        let regex = "[0-9]{10,11}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }
    
    //Regex para telefono
    func checkTelefonoLength(text: String) -> Bool {
        let regex = "[0-9]{7,12}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }
    
    //Regex para edad
    func checkEdadLength(text: String) -> Bool {
        let regex = "[0-9]{1,3}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }
    
    //Cambia el color del texto cuando encuentra error
    func changeTextFieldColor(value: Bool, textField: UITextField) {
        if (!value){
            textField.layer.borderColor = UIColor.red.cgColor
            textField.textColor = UIColor.red
        } else {
            textField.layer.borderColor = UIColor.black.cgColor
            textField.textColor = UIColor.black
        }
    }
    
    //Limitante de entrada de texto, manejo de errores en texto y caracteres permitidos
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        if textField == nombreTextField {
            let existOrNotNumber = checkTextNumber(text: newString)
            let newLength = (nombreTextField.text?.characters.count)! + string.characters.count - range.length
            return newLength <= 25
            changeTextFieldColor(value: existOrNotNumber, textField: nombreTextField)
        } else if textField == apellidosTextField {
            let existOrNotNumber = checkTextNumber(text: newString)
            changeTextFieldColor(value: existOrNotNumber, textField: apellidosTextField)
            let newLength = (apellidosTextField.text?.characters.count)! + string.characters.count - range.length
            return newLength <= 25
        } else if textField == emailTextField {
            let emailValidated = checkEmail(candidate: newString)
            changeTextFieldColor(value: emailValidated, textField: emailTextField)
            let newLength = (emailTextField.text?.characters.count)! + string.characters.count - range.length
            return newLength <= 25
        } else if textField == edadTextField {
            let onlyNumbers = checkOnlyNumbers(text: newString)
            changeTextFieldColor(value: onlyNumbers, textField: edadTextField)
            let length = checkEdadLength(text: newString)
            changeTextFieldColor(value: length, textField: edadTextField)
            let newLength = (edadTextField.text?.characters.count)! + string.characters.count - range.length
            return newLength <= 2
        } else if textField == telefonoTextField {
            let onlyNumbers = checkOnlyNumbers(text: newString)
            changeTextFieldColor(value: onlyNumbers, textField: telefonoTextField)
            let length = checkTelefonoLength(text: newString)
            changeTextFieldColor(value: length, textField: telefonoTextField)
            let newLength = (telefonoTextField.text?.characters.count)! + string.characters.count - range.length
            return newLength <= 10
        } else if textField == direccionTextField {
            let newLength = (direccionTextField.text?.characters.count)! + string.characters.count - range.length
            return newLength <= 25
        } else if textField == identificacionTextField {
            let onlyNumbers = checkOnlyNumbers(text: newString)
            changeTextFieldColor(value: onlyNumbers, textField: identificacionTextField)
            let length = checkIdentificacionLength(text: newString)
            changeTextFieldColor(value: length, textField: identificacionTextField)
            let newLength = (identificacionTextField.text?.characters.count)! + string.characters.count - range.length
            return newLength <= 11
        } else if textField == cargoTextField {
            let existOrNotNumber = checkTextNumber(text: newString)
            changeTextFieldColor(value: existOrNotNumber, textField: cargoTextField)
            let newLength = (cargoTextField.text?.characters.count)! + string.characters.count - range.length
            return newLength <= 25
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
        pedido.setNombres(name: nombreTextField.text!)
        return false
    }
    
    // Alert View
    /*
     func alertHandler(action: UIAlertAction) -> Void {
     print("Perfectirijillo")
     }
     */
    /*
     override func viewDidAppear(_ animated: Bool) {
     super.viewDidAppear(true)
     print(currentReachabilityStatus != .notReachable)
     if (currentReachabilityStatus != .notReachable){
     //true connected
     let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: UIAlertControllerStyle.alert)
     let defaultAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.default,                                              handler: alertHandler)
     
     alert.addAction(defaultAction)
     self.present(alert, animated:true, completion:nil)
     }
     } */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Present the view controller using the popover style.
        /*myPopoverViewController.modalPresentationStyle = UIModalPresentationPopover
         [self presentViewController:myPopoverViewController animated: YES completion: nil]
         
         // Get the popover presentation controller and configure it.
         UIPopoverPresentationController *presentationController =
         [myPopoverViewController popoverPresentationController]
         presentationController.permittedArrowDirections =
         UIPopoverArrowDirectionLeft | UIPopoverArrowDirectionRight
         presentationController.sourceView = myView
         presentationController.sourceRect = sourceRect*/
        
        //print(currentReachabilityStatus != .notReachable)
        /*if (currentReachabilityStatus != .notReachable){
         //true connected
         let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: UIAlertControllerStyle.alert)
         let defaultAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.default,                                              handler: alertHandler)
         
         alert.addAction(defaultAction)
         self.present(alert, animated:true, completion:nil)
         }*/
        
        
        
        //Caso en que la ventana ya haya sido completada
        if(pedido.getPrimeraVentana()){
            nombreTextField.text = pedido.getNombres()
            apellidosTextField.text = pedido.getApellidos()
            edadTextField.text = String(pedido.getEdad())
            emailTextField.text = pedido.getCorreo()
            telefonoTextField.text = pedido.getTelefono()
            direccionTextField.text = pedido.getDireccion()
            organizacionTextField.text = pedido.getOrgSocial()
            identificacionTextField.text = pedido.getIdentificacion()
            cargoTextField.text = pedido.getCargo()
        }
        
        //Obteniendo Estados Civiles del web service
        DispatchQueue.global(qos: .userInitiated).async { () -> Void in
            let urlEstCivil = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/estados-civiles/")
            let task = URLSession.shared.dataTask(with: urlEstCivil!) { (data, response, error) in
                self.estCivilOpciones.remove(at: 0)
                self.estCivilID.remove(at: 0)
                if error != nil {
                    self.noNetwork()
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
                                    if(self.pedido.getPrimeraVentana()){
                                        self.estCivilShow.text = self.estCivilOpciones[self.pedido.getEstCivil()]
                                    } else {
                                        self.estCivilShow.text = self.estCivilOpciones[0]
                                        self.pedido.setEstCivil(opcion: self.estCivilID[0])
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
        
        //Obteniendo Provincias del web service
        DispatchQueue.global(qos: .userInitiated).async { () -> Void in
            let urlProvincias = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/provincias/?limit=30")
            let task = URLSession.shared.dataTask(with: urlProvincias!) { (data, response, error) in
                self.provOpciones.remove(at: 0)
                self.provID.remove(at: 0)
                if error != nil {
                    self.noNetwork()
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
                                    if(self.pedido.getPrimeraVentana()){
                                        self.provShow.text = self.provOpciones[self.provID.index(of: self.pedido.getProvincia())!]
                                    } else {
                                        self.provShow.text = self.provOpciones[0]
                                        self.pedido.setProvincia(opcion: self.provID[0])
                                    }
                                }
                            }
                        } catch {
                            
                        }
                    }
                }
                if(self.pedido.getPrimeraVentana()){
                    self.searchCiudad(id: self.pedido.getProvincia())
                } else {
                    if(self.provID.count != 0){
                        self.searchCiudad(id: self.provID[0])
                    }
                }
            }
            task.resume()
        }
        
        //Obteniendo Niveles de Educacion del web service
        DispatchQueue.global(qos: .userInitiated).async { () -> Void in
            let urlNivEdu = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/niveles-educacion/")
            let task = URLSession.shared.dataTask(with: urlNivEdu!) { (data, response, error) in
                self.nivEduOpciones.remove(at: 0)
                self.nivEduID.remove(at: 0)
                if error != nil {
                    self.noNetwork()
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
                                    if(self.pedido.getPrimeraVentana()){
                                        self.nivEduShow.text = self.nivEduOpciones[self.nivEduID.index(of: self.pedido.getNivEdu())!]
                                    } else {
                                        self.nivEduShow.text = self.nivEduOpciones[0]
                                        self.pedido.setNivEdu(opcion: self.nivEduID[0])
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
        
        //Obteniendo Nacionalidades del web service
        DispatchQueue.global(qos: .userInitiated).async { () -> Void in
            let urlNac = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/nacionalidades/")
            let task = URLSession.shared.dataTask(with: urlNac!) { (data, response, error) in
                self.nacionOpciones.remove(at: 0)
                self.nacionID.remove(at: 0)
                if error != nil {
                    self.noNetwork()
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
                                    if(self.pedido.getPrimeraVentana()){
                                        self.nacionShow.text = self.nacionOpciones[self.nacionID.index(of: self.pedido.getNacion())!]
                                    } else {
                                        self.nacionShow.text = self.nacionOpciones[0]
                                        self.pedido.setNacion(opcion: self.nacionID[0])
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
        
        //Obteniendo Ocupacion del web service
        DispatchQueue.global(qos: .userInitiated).async { () -> Void in
            let urlOcupaciones = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/ocupaciones")
            let task = URLSession.shared.dataTask(with: urlOcupaciones!) { (data, response, error) in
                self.empleadoOpciones.remove(at: 0)
                self.empleadoID.remove(at: 0)
                if error != nil {
                    self.noNetwork()
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
                                    if(self.pedido.getPrimeraVentana()){
                                        self.empleadoShow.text = self.empleadoOpciones[self.empleadoID.index(of: self.pedido.getOcupacion())!]
                                    } else {
                                        self.empleadoShow.text = self.empleadoOpciones[0]
                                        self.pedido.setOcupacion(opcion: self.empleadoID[0])
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
        
        //Asignacion de delegado para textfield, para personalizar sus eventos
        nombreTextField.delegate = self
        apellidosTextField.delegate = self
        edadTextField.delegate = self
        emailTextField.delegate = self
        telefonoTextField.delegate = self
        direccionTextField.delegate = self
        organizacionTextField.delegate = self
        identificacionTextField.delegate = self
        cargoTextField.delegate = self
        
        //Ocultar
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
    }
    
    //Pregunta por los campos completados en la ventana actual, en caso de ser asi, pasa a la siguiente ventana; en caso contrario muestra mensaje apropiado. Esto se hace empleando la funcion "nextView"
    @IBAction func nextWindow(_ sender: UIButton) {
        nextView()
        if (pedido.getPrimeraVentana()){
            self.performSegue(withIdentifier: "p1p2", sender: self)
        } else {
            let alert = UIAlertController(title: "Pedidos", message: "Por favor llene todos los campos", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continuar", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //Obteniendo Ciudad del web service
    func searchCiudad(id: Int){
        let urlCiudad = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/ciudades/?provincia=" + String(id))
        let task1 = URLSession.shared.dataTask(with: urlCiudad!) { (data, response, error) in
            self.ciuOpciones.removeAll()
            self.ciuID.removeAll()
            if error != nil {
                self.noNetwork()
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
                                if(self.pedido.getPrimeraVentana()){
                                    if(self.ciuID.index(of: self.pedido.getCiudad()) != nil){
                                        self.ciuShow.text = self.ciuOpciones[self.ciuID.index(of: self.pedido.getCiudad())!]
                                    } else {
                                        self.pedido.setCiudad(opcion: self.ciuID[0])
                                        self.ciuShow.text = self.ciuOpciones[0]
                                    }
                                    if(self.ciuOpciones.count == 0){
                                        self.ciuShow.text = ""
                                    }
                                } else {
                                    if(self.ciuOpciones.count == 0){
                                        self.ciuShow.text = ""
                                    } else {
                                        self.ciuShow.text = self.ciuOpciones[0]
                                        self.pedido.setCiudad(opcion: self.ciuID[0])
                                    }
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
    
    private func noNetwork() -> Void {
        let alert = UIAlertController(title: "Conexión fallida", message: "Existe un problema con la conexión. Por favor intente más tarde.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: { action in
            //Se debe realizar reset a los datos
            self.pedido.resetData()
            self.performSegue(withIdentifier: "p1m", sender: self)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //Regreso a Main
    @IBAction func backToMain(_ sender: UIButton) {
        let alert = UIAlertController(title: "Pedidos", message: "¡Si retrocede se perderán los datos ingresados! ¿Desea regresar?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Sí", style: UIAlertActionStyle.default, handler: { action in
            //Se debe realizar reset a los datos
            self.pedido.resetData()
            self.performSegue(withIdentifier: "p1m", sender: self)
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //Agrega el manejador de tap al label
    func attachTapHandler(label: UILabel)->Void{
        let tap = UITapGestureRecognizer(target: self, action: #selector(PedidosController.tapFunction))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
    }
    
    //Manejador del tap
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
            if(ciuOpciones.count != 0){
                self.ciuSelector.isHidden = false
            }
        }
        hideAllKeyboards()
    }
    
    //Oculta cualquier teclado que se muestre
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
    }
    
    //Pregunta condiciones para poder avanzar a la siguiente ventana
    func nextView(){
        if(nombreTextField.text != "" && apellidosTextField.text != "" &&
            edadTextField.text != "" && emailTextField.text != "" &&
            telefonoTextField.text != "" && direccionTextField.text != "" &&
            organizacionTextField.text != "" && identificacionTextField.text != "" &&
            cargoTextField.text != "" && pedido.getProvincia() != 0){
            pedido.setNombres(name: nombreTextField.text!)
            pedido.setApellidos(lname: apellidosTextField.text!)
            pedido.setEdad(age: Int(edadTextField.text!)!)
            pedido.setCorreo(email: emailTextField.text!)
            pedido.setTelefono(phone: telefonoTextField.text!)
            pedido.setDireccion(address: direccionTextField.text!)
            pedido.setOrgSocial(social: organizacionTextField.text!)
            pedido.setIdentificacion(identification: identificacionTextField.text!)
            pedido.setCargo(position: cargoTextField.text!)
            pedido.setPrimeraVentana(boolean: true)
        }
    }
    
    @IBAction func buttonTap(_ sender: UIButton) {
        // get a reference to the view controller for the popover
        let popController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popoverID")
        popController.preferredContentSize = CGSize(width: 250, height: 50)
        popController.view.frame = CGRect(x: 30, y: 20, width: 10, height: 10)
        // set the presentation style
        popController.modalPresentationStyle = UIModalPresentationStyle.popover
        
        // set up the popover presentation controller
        popController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        popController.popoverPresentationController?.delegate = self
        popController.popoverPresentationController?.sourceView = sender // button
        popController.popoverPresentationController?.sourceRect = sender.bounds
        //popController.popoverPresentationController?.sourceRect = CGRect(x: 30, y: 20, width: 10, height: 10)
        
        // present the popover
        self.present(popController, animated: true, completion: nil)
    }
    /*
     // UIPopoverPresentationControllerDelegate method
     func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
     // Force popover style
     return UIModalPresentationStyle.popover
     }
     */
}


