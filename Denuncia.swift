//
//  Denuncia.swift
//  CPCCS App
//
//  Created by Leonardo on 4/10/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//

import Foundation

final class Denuncia{
    //Variables generales
    private var primeraVentana: Bool = false
    private var segundaVentana: Bool = false
    private var terceraVentana: Bool = false
    private var cuartaVentana: Bool = false
    static let shared = Denuncia()
    
    public func getPrimeraVentana() -> Bool{
        return primeraVentana
    }
    
    public func setPrimeraVentana(boolean: Bool){
        primeraVentana = boolean
    }
    
    //No mas instancias accidentales
    private init(){
        
    }
    
    //Variables de la primera ventana
    private var identidadChoice: Int = -1
    private var nombres: String = ""
    private var apellidos: String = ""
    private var edad: Int = 0
    private var correo: String = ""
    private var telefono: String = ""
    private var direccion: String = ""
    private var orgSocial: String = ""
    private var ocupacionChoice: Int = -1
    private var tipoIdenChoice: Int = -1
    private var identificacion: String = ""
    private var generoChoice: Int = -1
    private var estCivilChoice: Int = -1
    private var nivEduChoice: Int = -1
    private var cargo: String = ""
    private var nacionChoice: Int = -1
    private var resideChoice: Int = -1
    private var provChoice: Int = -1
    private var ciuChoice: Int = -1
    
    
    public func setIdentidad(opcion: Int) {
        Denuncia.shared.identidadChoice = opcion
    }
    
    public func getIdentidad() -> Int {
        return Denuncia.shared.identidadChoice
    }
    
    public func setNombres(name: String) {
        Denuncia.shared.nombres = name
    }
    
    public func getNombres() -> String {
        return Denuncia.shared.nombres
    }
    
    public func setApellidos(lname: String) {
        Denuncia.shared.apellidos = lname
    }
    
    public func setEdad(age: Int) {
        Denuncia.shared.edad = age
    }
    
    public func getEdad() -> Int {
        return Denuncia.shared.edad
    }
    
    public func setCorreo(email: String) {
        Denuncia.shared.correo = email
    }
    
    public func getCorreo() -> String {
        return Denuncia.shared.correo
    }
    
    public func setTelefono(phone: String) {
        Denuncia.shared.telefono = phone
    }
    
    public func getTelefono() -> String {
        return Denuncia.shared.telefono
    }
    
    public func setDireccion(address: String) {
        Denuncia.shared.direccion = address
    }
    
    public func getDireccion() -> String {
        return Denuncia.shared.direccion
    }
    
    public func setOrgSocial(social: String){
        Denuncia.shared.orgSocial = social
    }
    
    public func getOrgSocial() -> String {
        return Denuncia.shared.orgSocial
    }
    
    public func setOcupacion(opcion: Int) {
        Denuncia.shared.ocupacionChoice = opcion
    }
    
    public func getOcupacion() -> Int {
        return Denuncia.shared.ocupacionChoice
    }
    
    public func setTipoIden(opcion: Int) {
        Denuncia.shared.tipoIdenChoice = opcion
    }
    
    public func getTipoIden() -> Int {
        return Denuncia.shared.tipoIdenChoice
    }
    
    public func resetData() {
        Denuncia.shared.nombres = ""
    }
}

