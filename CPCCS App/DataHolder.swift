//
//  DataHolder.swift
//  CPCCS App
//
//  Created by Leonardo on 4/10/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//

import Foundation

final class DataHolder {
    //Variables generales
    private var primeraVentana: Bool = false
    private var segundaVentana: Bool = false
    private var terceraVentana: Bool = false
    static let shared = DataHolder()
    
    public func setPrimeraVentana(boolean: Bool){
        DataHolder.shared.primeraVentana = boolean
    }
    
    public func getPrimeraVentana() -> Bool{
        return DataHolder.shared.primeraVentana
    }
    
    public func setSegundaVentana(boolean: Bool){
        DataHolder.shared.segundaVentana = boolean
    }
    
    public func getSegundaVentana() -> Bool{
        return DataHolder.shared.segundaVentana
    }
    
    public func setTerceraVentana(boolean: Bool){
        DataHolder.shared.terceraVentana = boolean
    }
    
    public func getTerceraVentana() -> Bool{
        return DataHolder.shared.terceraVentana
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
        DataHolder.shared.identidadChoice = opcion
    }
    
    public func getIdentidad() -> Int {
        return DataHolder.shared.identidadChoice
    }
    
    public func setNombres(name: String) {
        DataHolder.shared.nombres = name
    }
    
    public func getNombres() -> String {
        return DataHolder.shared.nombres
    }
    
    public func setApellidos(lname: String) {
        DataHolder.shared.apellidos = lname
    }
    
    public func getApellidos() -> String {
        return DataHolder.shared.apellidos
    }
    
    public func setEdad(age: Int) {
        DataHolder.shared.edad = age
    }
    
    public func getEdad() -> Int {
        return DataHolder.shared.edad
    }
    
    public func setCorreo(email: String) {
        DataHolder.shared.correo = email
    }
    
    public func getCorreo() -> String {
        return DataHolder.shared.correo
    }
    
    public func setTelefono(phone: String) {
        DataHolder.shared.telefono = phone
    }
    
    public func getTelefono() -> String {
        return DataHolder.shared.telefono
    }
    
    public func setDireccion(address: String) {
        DataHolder.shared.direccion = address
    }
    
    public func getDireccion() -> String {
        return DataHolder.shared.direccion
    }
    
    public func setOrgSocial(social: String){
        DataHolder.shared.orgSocial = social
    }
    
    public func getOrgSocial() -> String {
        return DataHolder.shared.orgSocial
    }
    
    public func setOcupacion(opcion: Int) {
        DataHolder.shared.ocupacionChoice = opcion
    }
    
    public func getOcupacion() -> Int {
        return DataHolder.shared.ocupacionChoice
    }
    
    public func setTipoIden(opcion: Int) {
        DataHolder.shared.tipoIdenChoice = opcion
    }
    
    public func getTipoIden() -> Int {
        return DataHolder.shared.tipoIdenChoice
    }
    
    public func setIdentificacion(identification: String) {
        DataHolder.shared.identificacion = identification
    }
    
    public func getIdentificacion() -> String {
        return DataHolder.shared.identificacion
    }
    
    public func setGenero(opcion: Int) {
        DataHolder.shared.generoChoice = opcion
    }
    
    public func getGenero() -> Int {
        return DataHolder.shared.generoChoice
    }
    
    public func setEstCivil(opcion: Int) {
        DataHolder.shared.estCivilChoice = opcion
    }
    
    public func getEstCivil() -> Int {
        return DataHolder.shared.estCivilChoice
    }
    
    public func setNivEdu(opcion: Int) {
        DataHolder.shared.nivEduChoice = opcion
    }
    
    public func getNivEdu() -> Int {
        return DataHolder.shared.nivEduChoice
    }
    
    public func setCargo(position: String) {
        DataHolder.shared.cargo = position
    }
    
    public func getCargo() -> String {
        return DataHolder.shared.cargo
    }
    
    public func setNacion(opcion: Int) {
        DataHolder.shared.nacionChoice = opcion
    }
    
    public func getNacion() -> Int {
        return DataHolder.shared.nacionChoice
    }
    
    public func setReside(opcion: Int) {
        DataHolder.shared.resideChoice = opcion
    }
    
    public func getReside() -> Int {
        return DataHolder.shared.resideChoice
    }
    
    public func setProvincia(opcion: Int) {
        DataHolder.shared.provChoice = opcion
    }
    
    public func getProvincia() -> Int {
        return DataHolder.shared.provChoice
    }
    
    public func setCiudad(opcion: Int) {
        DataHolder.shared.ciuChoice = opcion
    }
    
    public func getCiudad() -> Int {
        return DataHolder.shared.ciuChoice
    }
    
    //Variables de la segunda ventana
    private var motivoDenuncia: String = ""
    private var compareceChoice: Int = 0
    private var documentosChoice: Int = 0
    
    public func setMotivo(motive: String) {
        DataHolder.shared.motivoDenuncia = motive
    }
    
    public func getMotivo() -> String {
        return DataHolder.shared.motivoDenuncia
    }
    
    public func setComparece(opcion: Int) {
        DataHolder.shared.compareceChoice = opcion
    }
    
    public func getComparece() -> Int {
        return DataHolder.shared.compareceChoice
    }
    
    public func setDocumentos(opcion: Int) {
        DataHolder.shared.documentosChoice = opcion
    }
    
    public func getDocumentos() -> Int {
        return DataHolder.shared.documentosChoice
    }
    
    //Variables de la tercera ventana
    private var nombresDenunciado: String = ""
    private var apellidosDenunciado: String = ""
    private var generoDenunciadoChoice: Int = 0
    private var institucionNombre: String = ""
    private var institucionChoice: Int = 0
    private var cargoDenunciado: String = ""
    private var ocupacionDenunciadoChoice: Int = 0
    private var provinciaDenunciadoChoice: Int = 0
    private var ciudadDenunciadoChoice: Int = 0
    private var cantidadPerjudicados: Int = 0
    private var unidadDireccion: String = ""
    
    public func setNombresDenunciado(name: String) {
        DataHolder.shared.nombresDenunciado = name
    }
    
    public func getNombresDenunciado() -> String {
        return DataHolder.shared.nombresDenunciado
    }
    
    public func setApellidosDenunciado(lname: String) {
        DataHolder.shared.apellidosDenunciado = lname
    }
    
    public func getApellidosDenunciado() -> String {
        return DataHolder.shared.apellidosDenunciado
    }
    
    public func setGeneroDenunciado(opcion: Int) {
        DataHolder.shared.generoDenunciadoChoice = opcion
    }
    
    public func getGeneroDenunciado() -> Int {
        return DataHolder.shared.generoDenunciadoChoice
    }
    
    public func setInstitucionNombre(iname: String) {
        DataHolder.shared.institucionNombre = iname
    }
    
    public func getInstitucionNombre() -> String {
        return DataHolder.shared.institucionNombre
    }
    
    public func setInstitucion(opcion: Int) {
        DataHolder.shared.institucionChoice = opcion
    }
    
    public func getInstitucion() -> Int {
        return DataHolder.shared.institucionChoice
    }
    
    public func setCargoDenunciado(string: String) {
        DataHolder.shared.cargoDenunciado = string
    }
    
    public func getCargoDenunciado() -> String {
        return DataHolder.shared.cargoDenunciado
    }
    
    public func setOcupacionDenunciado(opcion: Int) {
        DataHolder.shared.ocupacionDenunciadoChoice = opcion
    }
    
    public func getOcupacionDenunciado() -> Int {
        return DataHolder.shared.ocupacionDenunciadoChoice
    }
    
    public func setProvinciaDenunciado(opcion: Int) {
        DataHolder.shared.provinciaDenunciadoChoice = opcion
    }
    
    public func getProvinciaDenunciado() -> Int {
        return DataHolder.shared.provinciaDenunciadoChoice
    }
    
    public func setCiudadDenunciado(opcion: Int) {
        DataHolder.shared.ciudadDenunciadoChoice = opcion
    }
    
    public func getCiudadDenunciado() -> Int {
        return DataHolder.shared.ciudadDenunciadoChoice
    }
    
    public func setCantPerjudicados(opcion: Int) {
        DataHolder.shared.cantidadPerjudicados = opcion
    }
    
    public func getCantPerjudicados() -> Int {
        return DataHolder.shared.cantidadPerjudicados
    }
    
    public func setUnidadDireccion(string: String) {
        DataHolder.shared.unidadDireccion = string
    }
    
    public func getUnidadDireccion() -> String {
        return DataHolder.shared.unidadDireccion
    }
    
    public func resetData() {
        setPrimeraVentana(boolean: false)
        setSegundaVentana(boolean: false)
        setTerceraVentana(boolean: false)
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
        setDocumentos(opcion: 0)
        setNombresDenunciado(name: "")
        setApellidosDenunciado(lname: "")
        setGeneroDenunciado(opcion: 0)
        setInstitucionNombre(iname: "")
        setInstitucion(opcion: 0)
        setCargoDenunciado(string: "")
        setOcupacionDenunciado(opcion: 0)
        setProvinciaDenunciado(opcion: 0)
        setCiudadDenunciado(opcion: 0)
        setCantPerjudicados(opcion: 0)
        setUnidadDireccion(string: "")
    }
}

