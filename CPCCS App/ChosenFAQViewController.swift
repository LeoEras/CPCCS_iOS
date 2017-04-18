//
//  ChosenFAQViewController.swift
//  CPCCS App
//
//  Created by Leonardo on 4/17/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//

import UIKit

class ChosenFAQViewController: UIViewController {
    var FAQSelected = DataHolder.shared

    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var texto: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData(pregunta: FAQSelected.getFAQSelected())
    }

    @IBAction func backToFAQ(_ sender: UIButton) {
        self.FAQSelected.resetFAQSelected()
        self.performSegue(withIdentifier: "backToGeneralFAQ", sender: self)
    }
    
    //Carga datos para preguntas 
    //6, 7, 8, 9, 10, 11 y 12 en esta entrega (Leonardo, 18/04/2017)
    func loadData(pregunta: Int) -> Void {
        if(pregunta == 1){
            //
        } else if(pregunta == 1){
            //
        } else if(pregunta == 2){
            //
        } else if(pregunta == 3){
            //
        } else if(pregunta == 4){
            //
        } else if(pregunta == 5){
            //
        } else if(pregunta == 6){
            titulo.text = "¿Qué sucede si el celular no tiene conexión de internet?"
            texto.text = "Si usted desea enviar una denuncia o pedido debe estar conectado a internet, caso contrario no podrá llevar a cabo ninguna de las acciones nombradas."
        } else if(pregunta == 7){
            titulo.text = "¿Cuándo hacer una denuncia?"
            texto.text = "Cuando usted como ciudadano quiere informar sobre actos que generen corrupción o que afecten los derechos de participación ciudadana."
        } else if(pregunta == 8){
            titulo.text = "¿Qué ocurre cuando envío mi denuncia?"
            texto.text = "Cuando el usuario envíe su denuncia se envía una notificación al correo indicando que su denuncia fue enviada con éxito."
        } else if(pregunta == 9){
            titulo.text = "¿Qué ocurre cuando no se envía mi denuncia?"
            texto.text = "Si su denuncia no fue enviada puede ser por dos razones: no hay conexión en la página del CPCCS o no está conectado a internet."
        } else if(pregunta == 10){
            titulo.text = "¿Qué datos necesito para poder realizar una denuncia?"
            texto.text = "Es muy importante tener la sigueiente información para realizar una denuncia: Datos del denunciante (quien hace la denuncia), datos del denunciado (quien comete el acto de corrupción) y descripción del acto de corrupción."
        } else if(pregunta == 11){
            titulo.text = "¿Cuándo hacer un pedido?"
            texto.text = "Cuando usted como ciudadano quiere informar sobre asuntos que afecten la participación y el control social que no hayan sido atendidos por instituciones del sector público o por persona natural o jurídica privada que presete servicios públicos o desarrolle actividades de interés público."
        } else if(pregunta == 12){
            titulo.text = "¿Qué ocurre cuando envío mi pedido?"
            texto.text = "Cuando el usuario envíe su pedido se envía una notificación al correo indicando que su pedido fue enviada con éxito."
        } else if(pregunta == 13){
            //
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
