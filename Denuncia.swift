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
    static let shared = Denuncia()
    
    public func setPrimeraVentana(boolean: Bool){
        Denuncia.shared.primeraVentana = boolean
    }
    
    public func getPrimeraVentana() -> Bool{
        return Denuncia.shared.primeraVentana
    }
    
    public func setSegundaVentana(boolean: Bool){
        Denuncia.shared.segundaVentana = boolean
    }
    
    public func getSegundaVentana() -> Bool{
        return Denuncia.shared.segundaVentana
    }
    
    public func setTerceraVentana(boolean: Bool){
        Denuncia.shared.terceraVentana = boolean
    }
    
    public func getTerceraVentana() -> Bool{
        return Denuncia.shared.terceraVentana
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
    
    public func getApellidos() -> String {
        return Denuncia.shared.apellidos
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
    
    public func setIdentificacion(identification: String) {
        Denuncia.shared.identificacion = identificacion
    }
    
    public func getIdentificacion() -> String {
        return Denuncia.shared.identificacion
    }
    
    public func setGenero(opcion: Int) {
        Denuncia.shared.generoChoice = opcion
    }
    
    public func getGenero() -> Int {
        return Denuncia.shared.generoChoice
    }
    
    public func setEstCivil(opcion: Int) {
        Denuncia.shared.estCivilChoice = opcion
    }
    
    public func getEstCivil() -> Int {
        return Denuncia.shared.estCivilChoice
    }
    
    public func setNivEdu(opcion: Int) {
        Denuncia.shared.nivEduChoice = opcion
    }
    
    public func getNivEdu() -> Int {
        return Denuncia.shared.nivEduChoice
    }
    
    public func setCargo(position: String) {
        Denuncia.shared.cargo = position
    }
    
    public func getCargo() -> String {
        return Denuncia.shared.cargo
    }
    
    public func setNacion(opcion: Int) {
        Denuncia.shared.nacionChoice = opcion
    }
    
    public func getNacion() -> Int {
        return Denuncia.shared.nacionChoice
    }
    
    public func setReside(opcion: Int) {
        Denuncia.shared.resideChoice = opcion
    }
    
    public func getReside() -> Int {
        return Denuncia.shared.resideChoice
    }
    
    public func setProvincia(opcion: Int) {
        Denuncia.shared.provChoice = opcion
    }
    
    public func getProvincia() -> Int {
        return Denuncia.shared.provChoice
    }
    
    public func setCiudad(opcion: Int) {
        Denuncia.shared.ciuChoice = opcion
    }
    
    public func getCiudad() -> Int {
        return Denuncia.shared.ciuChoice
    }
    
    //Variables de la segunda ventana
    
    public func resetData() {
        Denuncia.shared.nombres = ""
    }
}

