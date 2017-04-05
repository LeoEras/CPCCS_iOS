//
//  ViewController.swift
//  CPCCS App
//
//  Created by Leonardo on 3/15/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//

import UIKit

class Pedidos3Controller: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
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
        if (pickerView == generoSelector){
            let titlerow = generoOpciones[row]
            return titlerow
        } else if(pickerView == ocupacionSelector){
            let titlerow = ocupacionOpciones[row]
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
        if (pickerView == generoSelector){
            self.generoShow.text = self.generoOpciones[row]
            self.generoSelector.isHidden = true
        } else if (pickerView == ocupacionSelector){
            self.ocupacionShow.text = self.ocupacionOpciones[row]
            self.ocupacionSelector.isHidden = true
        } else if (pickerView == provSelector){
            self.provShow.text = self.provOpciones[row]
            self.getCiuidad(id: provID[row])
            self.provSelector.isHidden = true
        } else if (pickerView == ciuSelector){
            self.ciuShow.text = self.ciuOpciones[row]
            self.ciuSelector.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                                self.ocupacionShow.text = self.ocupacionOpciones[0]
                                self.ocupacionSelector.isHidden = true
                                self.ocupacionSelector.reloadAllComponents()
                            }
                        }
                    } catch {
                        
                    }
                }
            }
        }
        task.resume()
        
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
    }
}


