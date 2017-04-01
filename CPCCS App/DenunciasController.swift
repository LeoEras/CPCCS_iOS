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
    var estCivilIndex = [0]
    
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
        }
    }
    
    //Al dejar de seleccionar el textfield
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    
    @IBOutlet weak var tripDetails: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let url = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/estados-civiles/") {
            do {
                let estCivilOnline = try String(contentsOf: url)
                let estCivilDepurado = estCivilOnline.components(separatedBy: "\"")
                
                estCivilOpciones.remove(at: 0)
                for i in 0...4{
                    estCivilOpciones.append(estCivilDepurado[11 + 6*i])
                    //estCivilIndex.append(Int(estCivilDepurado[14])!)
                }

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
        let urlString = "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/provincias/?limit=30&offset=0"
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error)
            } else {
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                    //print(parsedData)
                    /*let currentConditions = parsedData["nombre"] as! [String:Any]
                    
                    print(currentConditions)
                    
                    let currentTemperatureF = currentConditions["id"] as! Int
                    print(currentTemperatureF)*/
                } catch let error as NSError {
                    print(error)
                }
            }
            
            }.resume()
        if let url = URL(string: "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/provincias/?limit=30&offset=0") {
            do {
                let provOnline = try String(contentsOf: url)
                let provDepurado = provOnline.components(separatedBy: "\"")
                
                provOpciones.remove(at: 0)
                for i in 0...25{
                    provOpciones.append(provDepurado[11 + 6*i])
                }
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
        
        getProvincias()
        
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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(DenunciasController.tapFunction))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(DenunciasController.tapFunction))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(DenunciasController.tapFunction))
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(DenunciasController.tapFunction))
        let tap5 = UITapGestureRecognizer(target: self, action: #selector(DenunciasController.tapFunction))
        let tap6 = UITapGestureRecognizer(target: self, action: #selector(DenunciasController.tapFunction))
        let tap7 = UITapGestureRecognizer(target: self, action: #selector(DenunciasController.tapFunction))
        let tap8 = UITapGestureRecognizer(target: self, action: #selector(DenunciasController.tapFunction))
        let tap9 = UITapGestureRecognizer(target: self, action: #selector(DenunciasController.tapFunction))
        idenShow.isUserInteractionEnabled = true
        idenShow.addGestureRecognizer(tap)
        empleadoShow.isUserInteractionEnabled = true
        empleadoShow.addGestureRecognizer(tap2)
        tipoIdentShow.isUserInteractionEnabled = true
        tipoIdentShow.addGestureRecognizer(tap3)
        generoShow.isUserInteractionEnabled = true
        generoShow.addGestureRecognizer(tap4)
        estCivilShow.isUserInteractionEnabled = true
        estCivilShow.addGestureRecognizer(tap5)
        nivEduShow.isUserInteractionEnabled = true
        nivEduShow.addGestureRecognizer(tap6)
        resideShow.isUserInteractionEnabled = true
        resideShow.addGestureRecognizer(tap7)
        nacionShow.isUserInteractionEnabled = true
        nacionShow.addGestureRecognizer(tap8)
        provShow.isUserInteractionEnabled = true
        provShow.addGestureRecognizer(tap9)
        
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
    
    func tapFunction(sender:UITapGestureRecognizer) {
        if(sender.view == idenShow){
            nombreTextField.resignFirstResponder()
            self.identidadSelector.isHidden = false
        } else if(sender.view == empleadoShow){
            nombreTextField.resignFirstResponder()
            self.empleadoSelector.isHidden = false
        } else if(sender.view == tipoIdentShow){
            nombreTextField.resignFirstResponder()
            self.tipoIdentSelector.isHidden = false
        } else if(sender.view == generoShow){
            nombreTextField.resignFirstResponder()
            self.generoSelector.isHidden = false
        } else if(sender.view == estCivilShow){
            nombreTextField.resignFirstResponder()
            self.estCivilSelector.isHidden = false
        } else if(sender.view == nivEduShow){
            nombreTextField.resignFirstResponder()
            self.nivEduSelector.isHidden = false
        } else if(sender.view == resideShow){
            nombreTextField.resignFirstResponder()
            self.resideSelector.isHidden = false
        } else if(sender.view == nacionShow){
            nombreTextField.resignFirstResponder()
            self.nacionSelector.isHidden = false
        } else if(sender.view == provShow){
            nombreTextField.resignFirstResponder()
            self.provSelector.isHidden = false
        }
        //nombreTextField.resignFirstResponder()
        //self.provSelector.isHidden = false
    }
    
    @IBAction func grabNewImage(_ sender: AnyObject) {
        
    }
    
    // MARK: Make Network Request
    private func getProvincias(){
        let methodParameters = [
            "limit": "30",
        ]

        // create url and request
        let session = URLSession.shared
        let urlString = Constants.Cpccs.APIBaseURL + Constants.Requests.getProvincias + escapedParameters(methodParameters as [String:AnyObject])
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
    
        
        // create network request
        let task = session.dataTask(with: request) { (data, response, error) in
            
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
            
            print(estadosArray)
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
            /*performUIUpdatesOnMain {
                self.provShow.text = nombreString
            }*/
            
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
                
            }
            //print("\(idInt): \(nombreString)")
            //self.provOpciones.append(nombreString)
            //print(self.provOpciones[4])
            print(estadosCiviles.Ids.count)
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


