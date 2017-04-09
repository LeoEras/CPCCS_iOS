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
    
    @IBOutlet weak var idenShow: UILabel!
    @IBOutlet weak var identidadSelector: UIPickerView!
    var identidadOpciones = ["SI", "NO"]
    
    @IBOutlet weak var organizacionTextField: UITextField!
    @IBOutlet weak var direccionTextField: UITextField!
    @IBOutlet weak var telefonoTextField: UITextField!
    
    @IBOutlet weak var empleadoShow: UILabel!
    var empleadoOpciones = ["EMPLEADO PUBLICO", "EMPLEADO PRIVADO"]
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
    
    @IBOutlet weak var nacionShow: UILabel!
    @IBOutlet weak var nacionSelector: UIPickerView!
    var nacionOpciones = [""]
    
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
        } else if(pickerView == provSelector){
            let titlerow = provOpciones[row]
            //getCiuidad(id: provID[row])
            return titlerow
        }  else if(pickerView == ciuSelector){
            let titlerow = ciuOpciones[row]
            return titlerow
        }
        return ""
    }
    
    //Oculta el Picker View cuando una opcion es seleccionada
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == identidadSelector){
            self.idenShow.text = self.identidadOpciones[row]
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
        } else if (pickerView == provSelector){
            self.provShow.text = self.provOpciones[row]
            self.getCiuidad(id: provID[row])
            self.provSelector.isHidden = true
        } else if (pickerView == ciuSelector){
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
        
        return false
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == organizacionTextField {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "InstitucionPickerViewController") as! InstitucionPickerViewController
            //let controller = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
            //controller.institucion = institucion
            //navigationController!.pushViewController(controller, animated: true)
            self.present(controller, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    @IBAction func unwindToDenuncia(segue: UIStoryboardSegue){
        if let sourceViewController = segue.source as? InstitucionPickerViewController
            //, let institucion = sourceViewController.institucion 
            {
                let institucion = sourceViewController.institucion
                print("HOA")
                /*DispatchQueue.main.async {
                    self.organizacionTextField.text = institucion.nombre
                }*/
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let overlayButton = UIButton(type: .custom)
        //overlayButton.setImage(UIImage(named: ""), for: .normal)
        // overlayButton.addTarget(self, action: #selector(displayBookmarks(_:)), for: .touchUpInside)
        //overlayButton = CGRectMake(0, 0, 28, 28)
        
        //self.nombreTextField.leftView = overlayButton
        //self.nombreTextField.leftViewMode = UITextFieldViewModeAlways
        
        
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
                                    self.estCivilShow.text = self.estCivilOpciones[0]
                                    self.estCivilSelector.isHidden = true
                                    self.estCivilSelector.reloadAllComponents()
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
                                    self.provShow.text = self.provOpciones[0]
                                    self.provSelector.isHidden = true
                                    self.provSelector.reloadAllComponents()
                                }
                            }
                        } catch {
                        
                        }
                    }
                }
                self.getCiuidad(id: self.provID[0])
            }
            task1.resume()
        }
        
        DispatchQueue.global(qos: .userInitiated).async { () -> Void in
            if let url = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/niveles-educacion/") {
                do {
                    let nivEduOnline = try String(contentsOf: url)
                    let nivEduDepurado = nivEduOnline.components(separatedBy: "\"")
                
                    self.nivEduOpciones.remove(at: 0)
                    self.nivEduOpciones.append(nivEduDepurado[11])
                    self.nivEduOpciones.append(nivEduDepurado[19])
                    self.nivEduOpciones.append(nivEduDepurado[27])
                    self.nivEduOpciones.append(nivEduDepurado[35])
                
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
                
                    self.nacionOpciones.remove(at: 0)
                    self.nacionOpciones.append(nacionDepurado[11])
                    self.nacionOpciones.append(nacionDepurado[17])
                } catch {
                    // contents could not be loaded
                }
            } else {
                // the URL was bad!
            }
        }
        //getProvincias(){
        //    debugPrint(self.provOpciones)
        //}
        
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
                                self.ciuShow.text = self.ciuOpciones[0]
                                self.ciuSelector.isHidden = true
                                self.ciuSelector.reloadAllComponents()
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
        //nombreTextField.resignFirstResponder()
        //self.provSelector.isHidden = false
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
    }
    
    // MARK: Make Network Request
    private func getProvincias(completionHandler: @escaping ()->()){
        let methodParameters = [
            "limit": "30",
            ]
        
        // create url and request
        let session = URLSession.shared
        let urlString = Constants.Cpccs.APIBaseURL + Constants.Requests.getProvincias + escapedParameters(methodParameters as [String:AnyObject])
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        // create network request
        let task = session.dataTask(with: request) { [weak weakSelf = self] (data, response, error) in
            
            // if an error occurs, print it and re-enable the UI
            func displayError(_ error: String) {
                print(error)
                print("URL at time of error: \(url)")
            }
            
            /* GUARD: Was there an error? */
            guard (error == nil) else {
                displayError("There was an error with your request: \(error)")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                displayError("Your request returned a status code other than 2xx!")
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                displayError("No data was returned by the request!")
                return
            }
            
            // parse the data
            let parsedResult: [String:AnyObject]!
            do {
                parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
            } catch {
                displayError("Could not parse the data as JSON: '\(data)'")
                return
            }
            
            /* GUARD: Are the "provincias" and "provincias" keys in our result? */
            guard let estadosArray = parsedResult[Constants.CpccsResponseKeys.Results] as? [[String:AnyObject]] else {
                displayError("Cannot find keys '\(Constants.CpccsResponseKeys.Results)' in \(parsedResult)")
                return
            }
            
            //print(estadosArray)
            // select a random photo
            //let randomPhotoIndex = Int(arc4random_uniform(UInt32(estadosArray.count)))
            //let estadoDictionary = estadosArray[randomPhotoIndex] as [String:AnyObject]
            /* GUARD: Does our photo have a key for 'url_m'? */
            /*guard let nombreString = estadoDictionary[Constants.CpccsResponseKeys.Nombre] as? String else {
             displayError("Cannot find key '\(Constants.CpccsResponseKeys.Nombre)' in \(estadoDictionary)")
             return
             }*/
            
            // if an image exists at the url, set the image and title
            //if let Data = try? Data(contentsOf: nombreString) {
            
            
            class Provincias {
                var Nombres: [String] = []
                var Ids: [Int] = []
            }
            
            let estadosCiviles = Provincias()
            for estadoCivil in estadosArray{
                guard let nombreString = estadoCivil[Constants.CpccsResponseKeys.Nombre] as? String else {
                    displayError("Cannot find key '\(Constants.CpccsResponseKeys.Nombre)' in \(estadosArray)")
                    return
                }
                guard let idInt = estadoCivil[Constants.CpccsResponseKeys.Id] as? Int else {
                    displayError("Cannot find key '\(Constants.CpccsResponseKeys.Id)' in \(estadosArray)")
                    return
                }
                self.provOpciones.append(nombreString)
            }
        }
        
        // start the task!
        task.resume()
    }
    
    // MARK: Helper for Escaping Parameters in URL
    private func escapedParameters(_ parameters: [String:AnyObject]) -> String {
        
        if parameters.isEmpty {
            return ""
        } else {
            var keyValuePairs = [String]()
            
            for (key, value) in parameters {
                
                // make sure that it is a string value
                let stringValue = "\(value)"
                
                // escape it
                let escapedValue = stringValue.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                
                // append it
                keyValuePairs.append(key + "=" + "\(escapedValue!)")
                
            }
            
            return "?\(keyValuePairs.joined(separator: "&"))"
        }
    }
}


