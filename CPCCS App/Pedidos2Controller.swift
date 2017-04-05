//
//  ViewController.swift
//  CPCCS App
//
//  Created by Leonardo on 3/15/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//

import UIKit

class Pedidos2Controller: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    
    @IBOutlet weak var denunciaText: UITextView!
    @IBOutlet weak var compareceShow: UILabel!
    @IBOutlet weak var compareceSelector: UIPickerView!
    var compareceOpciones = ["SI", "NO"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Numero de filas en el picker View
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = 1
        if (pickerView == compareceSelector){
            countrows = self.compareceOpciones.count
        }
        return countrows
    }
    
    //Que va en cada fila del Picker View
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == compareceSelector){
            let titlerow = compareceOpciones[row]
            return titlerow
        }
        return ""
    }
    
    //Oculta el Picker View cuando una opcion es seleccionada
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == compareceSelector){
            self.compareceShow.text = self.compareceOpciones[row]
            self.compareceSelector.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        denunciaText.delegate = self
        attachTapHandler(label: compareceShow)
    }
    
    //Agrega el manejador de tap al label
    func attachTapHandler(label: UILabel)->Void{
        let tap = UITapGestureRecognizer(target: self, action: #selector(Denuncias2Controller.tapFunction))
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
        }
    }
}


