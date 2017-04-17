//
//  Pedidos2Controller.swift
//  CPCCS App
//
//  Created by Leonardo on 3/15/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//

import UIKit

class Pedidos2Controller: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    var pedido = DataHolder.shared
    
    @IBOutlet weak var denunciaText: UITextView!
    @IBOutlet weak var compareceShow: UILabel!
    @IBOutlet weak var compareceSelector: UIPickerView!
    var compareceOpciones = ["SI", "NO"]
    
    @IBOutlet weak var documentosShow: UILabel!
    @IBOutlet weak var documentosSelector: UIPickerView!
    var documentosOpciones = ["SI", "NO"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Numero de filas en el picker View
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = 1
        if (pickerView == compareceSelector){
            countrows = self.compareceOpciones.count
        } else if (pickerView == documentosSelector){
            countrows = self.documentosOpciones.count
        }
        return countrows
    }
    
    //Que va en cada fila del Picker View
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pedido.getSegundaVentana()){
            if(pickerView == compareceSelector){
                let titlerow = compareceOpciones[row]
                compareceShow.text = compareceOpciones[pedido.getComparece()]
                return titlerow
            } else if(pickerView == documentosSelector){
                let titlerow = compareceOpciones[row]
                compareceShow.text = compareceOpciones[pedido.getComparece()]
                return titlerow
            }
        } else {
            if(pickerView == compareceSelector){
                pedido.setComparece(opcion: row)
                let titlerow = compareceOpciones[row]
                return titlerow
            } else if(pickerView == documentosSelector){
                pedido.setDocumentos(opcion: row)
                let titlerow = documentosOpciones[row]
                return titlerow
            }
        }
        return ""
    }
    
    //Oculta el Picker View cuando una opcion es seleccionada
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == compareceSelector){
            pedido.setComparece(opcion: row)
            self.compareceShow.text = self.compareceOpciones[row]
            self.compareceSelector.isHidden = true
        } else if (pickerView == documentosSelector){
            pedido.setDocumentos(opcion: row)
            self.documentosShow.text = self.compareceOpciones[row]
            self.documentosSelector.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        denunciaText.delegate = self
        
        if(pedido.getSegundaVentana()){
            denunciaText.text = pedido.getMotivo()
        }
        
        attachTapHandler(label: compareceShow)
        attachTapHandler(label: documentosShow)
    }
    
    @IBAction func nextWindow(_ sender: UIButton) {
        nextView()
        if (pedido.getSegundaVentana()){
            self.performSegue(withIdentifier: "p2p3", sender: self)
        } else {
            // create the alert
            let alert = UIAlertController(title: "Pedidos", message: "Por favor llene todos los campos", preferredStyle: UIAlertControllerStyle.alert)
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Continuar", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func backToMain(_ sender: UIButton) {
        // create the alert
        let alert = UIAlertController(title: "Pedido", message: "¡Si retrocede se perderán los datos ingresados! ¿Desea regresar?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Sí", style: UIAlertActionStyle.default, handler: { action in
            self.pedido.resetData()
            self.performSegue(withIdentifier: "p2m", sender: self)
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    //Agrega el manejador de tap al label
    func attachTapHandler(label: UILabel)->Void{
        let tap = UITapGestureRecognizer(target: self, action: #selector(Pedidos2Controller.tapFunction))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n"){
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func tapFunction(sender:UITapGestureRecognizer) {
        if(sender.view == compareceShow){
            denunciaText.resignFirstResponder()
            self.compareceSelector.isHidden = false
        } else if(sender.view == documentosShow){
            denunciaText.resignFirstResponder()
            self.documentosSelector.isHidden = false
        }
        hideAllKeyboards()
    }
    
    func hideAllKeyboards(){
        denunciaText.resignFirstResponder()
    }
    
    func nextView(){
        if(denunciaText.text != ""){
            pedido.setMotivo(motive: denunciaText.text!)
            pedido.setSegundaVentana(boolean: true)
        }
    }
}


