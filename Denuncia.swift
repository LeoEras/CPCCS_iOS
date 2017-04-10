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
    private var primeraVentana: Bool = true
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
    private var identidadChoice: Int = 0
    private var nombres: String = ""
    private var apellidos: String = ""
    private var edad: Int = 0
    private var correo: String = ""
    private var telefono: String = ""
    private var direccion: String = ""
    private var orgSocial: String = ""
    private var ocupacionChoice: Int = 0
    private var tipoIdenChoice: Int = 0
    private var identificacion: String = ""
    private var generoChoice: Int = 0
    private var estCivilChoice: Int = 0
    private var nivEduChoice: Int = 0
    private var cargo: String = ""
    private var nacionChoice: Int = 0
    private var resideChoice: Int = 0
    private var provChoice: Int = 0
    private var ciuChoice: Int = 0
    
    
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
        Denuncia.shared.identificacion = identification
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
    private var motivoDenuncia: String = ""
    private var compareceChoice: Int = 0
    
    public func setMotivo(motive: String) {
        Denuncia.shared.motivoDenuncia = motive
    }
    
    public func getMotivo() -> String {
        return Denuncia.shared.motivoDenuncia
    }
    
    public func setComparece(opcion: Int) {
        Denuncia.shared.compareceChoice = opcion
    }
    
    public func getComparece() -> Int {
        return Denuncia.shared.compareceChoice
    }
    
    public func resetData() {
        setIdentidad(opcion: 0)
        setNombres(name: "")
        setApellidos(lname: "")
        setEdad(age: 0)
        setCorreo(email: "")
        setTelefono(phone: "")
        setDireccion(address: "")
        setOrgSocial(social: "")
        setOcupacion(opcion: 0)
        setTipoIden(opcion: 0)
        setIdentificacion(identification: "")
        setGenero(opcion: 0)
        setEstCivil(opcion: 0)
        setNivEdu(opcion: 0)
        setCargo(position: "")
        setNacion(opcion: 0)
        setProvincia(opcion: 0)
        setCiudad(opcion: 0)
        setMotivo(motive: "")
        setComparece(opcion: 0)
    }
}

