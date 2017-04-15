//
//  InstitucionPickViewController.swift
//  CPCCS App
//
//  Created by Tester on 4/6/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//

import UIKit

// MARK: - Web Service Client
class CPCCSClient : NSObject {
    
    // MARK: Properties
    
    // shared session
    var session = URLSession.shared
    
    // authentication state
    //var requestToken: String? = nil
    //var sessionID: String? = nil
    //var userID: Int? = nil
    
    // MARK: Initializers
    
    override init() {
        super.init()
    }
    
    // MARK: GET
    
    func taskForGETMethod(_ method: String, parameters: [String:AnyObject], completionHandlerForGET: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) -> URLSessionDataTask {
        
        /* 1. Set the parameters */
        var parametersWithApiKey = parameters
        //parametersWithApiKey[ParameterKeys.ApiKey] = Constants.ApiKey as AnyObject?
        
        /* 2/3. Build the URL, Configure the request */
        let request = NSMutableURLRequest(url: cpccsURLFromParameters(parametersWithApiKey, withPathExtension: method))
        
        /* 4. Make the request */
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            func sendError(_ error: String) {
                print(error)
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandlerForGET(nil, NSError(domain: "taskForGETMethod", code: 1, userInfo: userInfo))
            }
            
            /* GUARD: Was there an error? */
            guard (error == nil) else {
                sendError("There was an error with your request: \(error)")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                sendError("Your request returned a status code other than 2xx!")
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                sendError("No data was returned by the request!")
                return
            }
            
            /* 5/6. Parse the data and use the data (happens in completion handler) */
            self.convertDataWithCompletionHandler(data, completionHandlerForConvertData: completionHandlerForGET)
        }
        
        /* 7. Start the request */
        task.resume()
        
        return task
    }
    
    // MARK: POST
    
    func taskForPOSTMethod(_ method: String, parameters: [String:AnyObject], jsonBody: String, completionHandlerForPOST: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) -> URLSessionDataTask {
        
        /* 1. Set the parameters */
        var parametersWithApiKey = parameters
        let username = ""
        let password = ""
        let loginString = NSString(format: "%@:%@", username, password)
        let loginData: NSData = loginString.data(using: String.Encoding.utf8.rawValue)! as NSData
        let base64LoginString = loginData.base64EncodedString(options: [ ])
        
        /* 2/3. Build the URL, Configure the request */
        let request = NSMutableURLRequest(url: cpccsURLFromParameters(parametersWithApiKey, withPathExtension: method))
        request.httpMethod = "POST"
        request.addValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonBody.data(using: String.Encoding.utf8)
        
        /* 4. Make the request */
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            func sendError(_ error: String) {
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandlerForPOST(nil, NSError(domain: "taskForPostTMethod", code: 1, userInfo: userInfo))
            }
            
            /* GUARD: Was there an error? */
            guard (error == nil) else {
                sendError("There was an error with your request: \(error)")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? x
             guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
             sendError("Your request returned a status code other than 2xx!")
             return
             }*/
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return sendError("Invalid response: \(response)")
            }
            
            guard httpResponse.statusCode >= 200 && httpResponse.statusCode <= 299 else {
                return sendError("Recieved the following status code: \(httpResponse.statusCode)")
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                sendError("No data was returned by the request!")
                return
            }
            
            /* 5/6. Parse the data and use the data (happens in completion handler) */
            self.convertDataWithCompletionHandler(data, completionHandlerForConvertData: completionHandlerForPOST)
            
        }
        
        /* 7. Start the request */
        task.resume()
        
        return task
    }

    
    // MARK: Helpers
    
    // substitute the key for the value that is contained within the method name
    func substituteKeyInMethod(_ method: String, key: String, value: String) -> String? {
        if method.range(of: "{\(key)}") != nil {
            return method.replacingOccurrences(of: "{\(key)}", with: value)
        } else {
            return nil
        }
    }
    
    // given raw JSON, return a usable Foundation object
    private func convertDataWithCompletionHandler(_ data: Data, completionHandlerForConvertData: (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
        var parsedResult: AnyObject! = nil
        do {
            parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
        } catch {
            let userInfo = [NSLocalizedDescriptionKey : "Could not parse the data as JSON: '\(data)'"]
            completionHandlerForConvertData(nil, NSError(domain: "convertDataWithCompletionHandler", code: 1, userInfo: userInfo))
        }
        
        completionHandlerForConvertData(parsedResult, nil)
    }
    
    // create a URL from parameters
    private func cpccsURLFromParameters(_ parameters: [String:AnyObject], withPathExtension: String? = nil) -> URL {
        
        var components = URLComponents()
        components.scheme = CPCCSClient.Constants.ApiScheme
        components.host = CPCCSClient.Constants.ApiHost
        components.path = CPCCSClient.Constants.ApiPath + (withPathExtension ?? "")
        components.queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        return components.url!
    }
    
    // MARK: Shared Instance
    
    class func sharedInstance() -> CPCCSClient {
        struct Singleton {
            static var sharedInstance = CPCCSClient()
        }
        return Singleton.sharedInstance
    }
}

extension CPCCSClient {
    
    func getInstitucionesForSearchString(_ searchString: String, completionHandlerForInstituciones: @escaping (_ result: [Institucion]?, _ error: NSError?) -> Void) -> URLSessionDataTask? {
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = ["search": searchString]
        
        /* 2. Make the request */
        let task = taskForGETMethod("/instituciones", parameters: parameters as [String:AnyObject]) { (results, error) in
            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionHandlerForInstituciones(nil, error)
            } else {
                
                if let results = results?["results"] as? [[String:AnyObject]] {
                    
                    let instituciones =  Institucion.institucionesFromResults(results)
                    completionHandlerForInstituciones(instituciones, nil)
                } else {
                    completionHandlerForInstituciones(nil, NSError(domain: "getInstitucionesForSearchString parsing", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse getMoviesForSearchString"]))
                }
            }
        }
        return task
    }
    
    func postToPreDenuncia(_ predenuncia: PreDenuncia, completionHandlerForPreDenuncia: @escaping (_ result: Int?, _ error: NSError?) -> Void) {
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [ :] as [String:AnyObject]
    
        let jsonBody = "{\"\(CPCCSClient.JSONBodyKeys.tipo)\": \"\(predenuncia.tipo)\",\"\(CPCCSClient.JSONBodyKeys.generoDenunciante)\": \"\(predenuncia.genero_denunciante)\",\"\(CPCCSClient.JSONBodyKeys.descripcionInvestigacion)\": \"\(predenuncia.descripcion_investigacion)\",\"\(CPCCSClient.JSONBodyKeys.generoDenunciado)\": \"\(predenuncia.genero_denunciado)\",\"\(CPCCSClient.JSONBodyKeys.funcionarioPublico)\": \"\(predenuncia.funcionario_publico)\",\"\(CPCCSClient.JSONBodyKeys.nivelEducacionDenunciante)\": \(predenuncia.nivel_educacion_denunciante),\"\(CPCCSClient.JSONBodyKeys.ocupacionDenunciante)\": \(predenuncia.ocupacion_denunciante),\"\(CPCCSClient.JSONBodyKeys.nacionalidadDenunciante)\": \(predenuncia.nacionalidad_denunciante),\"\(CPCCSClient.JSONBodyKeys.estadoCivilDenunciante)\": \(predenuncia.estado_civil_denunciante),\"\(CPCCSClient.JSONBodyKeys.institucionImplicada)\": \(predenuncia.institucion_implicada)}"
        
        /* 2. Make the request */
        let _ = taskForPOSTMethod(CPCCSClient.Methods.CreatePredenuncia, parameters: parameters as [String:AnyObject], jsonBody: jsonBody) { (results, error) in
            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionHandlerForPreDenuncia(nil, error)
            } else {
                if let results = results?[CPCCSClient.JSONResponseKeys.StatusCode] as? Int {
                    completionHandlerForPreDenuncia(results, nil)
                } else {
                    completionHandlerForPreDenuncia(nil, NSError(domain: "postToFavoritesList parsing", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse postToFavoritesList"]))
                }
            }
        }
    }
    
    func postToReclamo(_ reclamo: Reclamo, completionHandlerForReclamo: @escaping (_ result: Int?, _ error: NSError?) -> Void) {
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [ :] as [String:AnyObject]
        
        let jsonBody = "{\"\(CPCCSClient.JSONBodyKeys.nombApelDenunciante)\": \"\(reclamo.nombApelDenunciante)\",\"\(CPCCSClient.JSONBodyKeys.tipoIdentificacion)\": \"\(reclamo.tipoIdentificacion)\",\"\(CPCCSClient.JSONBodyKeys.numIdentificacion)\": \"\(reclamo.numIdentificacion)\",\"\(CPCCSClient.JSONBodyKeys.direccion)\": \"\(reclamo.direccion)\",\"\(CPCCSClient.JSONBodyKeys.email)\": \"\(reclamo.email)\",\"\(CPCCSClient.JSONBodyKeys.nombApelDenunciado)\": \"\(reclamo.nombApelDenunciado )\",\"\(CPCCSClient.JSONBodyKeys.telefono)\": \"\(reclamo.telefono)\",\"\(CPCCSClient.JSONBodyKeys.cargo)\": \"\(reclamo.cargo)\",\"\(CPCCSClient.JSONBodyKeys.comparecer)\": \(reclamo.comparecer),\"\(CPCCSClient.JSONBodyKeys.documentores)\": \(reclamo.documentores),\"\(CPCCSClient.JSONBodyKeys.identidadReservada)\": \(reclamo.identidadReservada),\"\(CPCCSClient.JSONBodyKeys.resideExtranjero)\": \(reclamo.resideExtranjero),\"\(CPCCSClient.JSONBodyKeys.ciudadDelDenunciante)\": \(reclamo.ciudadDelDenunciante),\"\(CPCCSClient.JSONBodyKeys.ciudadDelDenunciado)\": \(reclamo.ciudadDelDenunciado),\"\(CPCCSClient.JSONBodyKeys.institucionImplicadaReclamo)\": \(reclamo.institucionImplicadaReclamo),\"\(CPCCSClient.JSONBodyKeys.provinciaDenunciante)\": \(reclamo.provinciaDenunciante),\"\(CPCCSClient.JSONBodyKeys.provinciaDenunciado)\": \(reclamo.provinciaDenunciado)}"
        
        /* 2. Make the request */
        let _ = taskForPOSTMethod(CPCCSClient.Methods.CreateReclamo, parameters: parameters as [String:AnyObject], jsonBody: jsonBody) { (results, error) in
            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionHandlerForReclamo(nil, error)
            } else {
                if let results = results?[CPCCSClient.JSONResponseKeys.StatusCode] as? Int {
                    completionHandlerForReclamo(results, nil)
                } else {
                    completionHandlerForReclamo(nil, NSError(domain: "postToReclamo parsing", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse postToReclamo"]))
                }
            }
        }
    }

}

// MARK: - CPCCSClient (Constants)

extension CPCCSClient {
    
    // MARK: Constants
    struct Constants {
        // MARK: URLs
        static let ApiScheme = "http"
        static let ApiHost = "custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com"
        static let ApiPath = ""
    }
    
    // MARK: Methods
    struct Methods {
        
        // MARK: Search
        static let SearchInstitucion = "/instituciones"
        static let CreatePredenuncia = "/predenuncias/"
        static let CreateReclamo = "/reclamos/"
    }
    
    // MARK: URL Keys
    struct URLKeys {
        static let UserID = "id"
    }
    
    // MARK: Parameter Keys
    struct ParameterKeys {
        static let ApiKey = "api_key"
        static let SessionID = "session_id"
        static let RequestToken = "request_token"
        static let Query = "query"
    }
    
    struct JSONBodyKeys {
        // Predenuncia
        static let tipo = "tipo"
        static let generoDenunciante = "genero_denunciante"
        static let descripcionInvestigacion = "descripcion_investigacion"
        static let generoDenunciado = "genero_denunciado"
        static let funcionarioPublico = "funcionario_publico"
        static let nivelEducacionDenunciante = "nivel_educacion_denunciante"
        static let ocupacionDenunciante = "ocupacion_denunciante"
        static let nacionalidadDenunciante = "nacionalidad_denunciante"
        static let estadoCivilDenunciante = "estado_civil_denunciante"
        static let institucionImplicada = "institucion_implicada"
        static let idReclamo = "id_reclamo"
        
        //Reclamo
        static let nombApelDenunciante = "nombres_apellidos_denunciante"
        static let tipoIdentificacion = "tipo_identificacion"
        static let numIdentificacion = "numero_identificacion"
        static let direccion = "direccion"
        static let email = "email"
        static let nombApelDenunciado = "nombres_apellidos_denunciado"
        static let telefono = "telefono"
        static let cargo = "cargo"
        static let comparecer = "comparecer"
        static let documentores = "documentores"
        static let identidadReservada = "identidad_reservada"
        static let resideExtranjero = "reside_extranjero"
        static let ciudadDelDenunciante = "ciudad_del_denunciante"
        static let ciudadDelDenunciado = "ciudad_del_denunciado"
        static let institucionImplicadaReclamo = "institucion_implicada"
        static let provinciaDenunciante = "provincia_denunciante"
        static let provinciaDenunciado = "provincia_denunciado"
    }
    
    // MARK: JSON Response Keys
    struct JSONResponseKeys {
        
        // MARK: General
        static let StatusMessage = "status_message"
        static let StatusCode = "status_code"
        
        // MARK: Authorization
        static let RequestToken = "request_token"
        static let SessionID = "session_id"
        
    }
    
}

// MARK: - Prepedido Struct

struct Institucion {  // MARK: Properties
    
    let nombre: String
    let id: Int
    
    // MARK: Initializers
    
    // construct a Institucion from a dictionary
    init(dictionary: [String:AnyObject]) {
        nombre = dictionary["nombre"] as! String
        id = dictionary["id"] as! Int
    }
    
    static func institucionesFromResults(_ results: [[String:AnyObject]]) -> [Institucion] {
        
        var instituciones = [Institucion]()
        
        // iterate through array of dictionaries, each Movie is a dictionary
        for result in results {
            instituciones.append(Institucion(dictionary: result))
        }
        
        return instituciones
    }
    
}


// MARK: - PreDenuncia Struct

struct PreDenuncia {  // MARK: Properties
    
    let tipo: String
    let genero_denunciante: String
    let descripcion_investigacion: String
    let genero_denunciado: String
    let funcionario_publico: String
    let nivel_educacion_denunciante: Int
    let ocupacion_denunciante: Int
    let nacionalidad_denunciante: Int
    let estado_civil_denunciante: Int
    let institucion_implicada: Int
    
    // MARK: Initializers
    
    // construct a Institucion from a dictionary
    init(tipo: String, genero1: String, descripcion: String, genero2: String, funcionario: String, nivelEdu: Int, ocupacion: Int, nacionalidad: Int, estadoCivil: Int, institucionImpl: Int) {
        self.tipo = tipo
        self.genero_denunciante = genero1
        self.descripcion_investigacion = descripcion
        self.genero_denunciado = genero2
        self.funcionario_publico = funcionario
        self.nivel_educacion_denunciante = nivelEdu
        self.ocupacion_denunciante = ocupacion
        self.nacionalidad_denunciante = nacionalidad
        self.estado_civil_denunciante = estadoCivil
        self.institucion_implicada = institucionImpl
    }
}

// MARK: -  Reclamo Struct

struct Reclamo {  // MARK: Properties
    
    let nombApelDenunciante: String
    let tipoIdentificacion: String
    let numIdentificacion: String
    let direccion: String
    let email: String
    let nombApelDenunciado: String
    let telefono: String
    let cargo: String
    let comparecer: Bool
    let documentores: Bool
    let identidadReservada: Bool
    let resideExtranjero: Bool
    let ciudadDelDenunciante: Int
    let ciudadDelDenunciado: Int
    let institucionImplicadaReclamo: Int
    let provinciaDenunciante: Int
    let provinciaDenunciado: Int
    
    // MARK: Initializers
    
    // construct a Institucion from a dictionary
    init(nombApelDenunciante: String, tipoIdentificacion: String, numIdentificacion: String, direccion: String, email: String, nombApelDenunciado: String, telefono: String, cargo: String, comparecer: Bool,documentores: Bool, identidadReservada: Bool, resideExtranjero: Bool, ciudadDelDenunciante: Int, ciudadDelDenunciado: Int, institucionImplicadaReclamo: Int, provinciaDenunciante: Int, provinciaDenunciado: Int) {
        
        self.nombApelDenunciante = nombApelDenunciante
        self.tipoIdentificacion = tipoIdentificacion
        self.numIdentificacion = numIdentificacion
        self.direccion = direccion
        self.email = email
        self.nombApelDenunciado = nombApelDenunciado
        self.telefono = telefono
        self.cargo = cargo
        self.comparecer = comparecer
        self.documentores = documentores
        self.identidadReservada = identidadReservada
        self.resideExtranjero = resideExtranjero
        self.ciudadDelDenunciante = ciudadDelDenunciante
        self.ciudadDelDenunciado = ciudadDelDenunciado
        self.institucionImplicadaReclamo = institucionImplicadaReclamo
        self.provinciaDenunciante = provinciaDenunciante
        self.provinciaDenunciado = provinciaDenunciado
    }
    
}

// MARK: - TMDBMovie: Equatable

extension Institucion: Equatable {}

func ==(lhs: Institucion, rhs: Institucion) -> Bool {
    return lhs.id == rhs.id
}

// MARK: - InstitucionPickerViewControllerDelegate

protocol InstitucionPickerViewControllerDelegate {
    func institucionPicker(_ institucionPicker: InstitucionPickerViewController, didPickInstitucion institucion: Institucion?)
}

class InstitucionPickerViewController: UIViewController {
    // MARK: Properties
    // Los datos para la tabla
    var instituciones = [Institucion]()
    
    // the delegate will typically be a view controller, waiting for the Institucion Picker to return an institucion
    var delegate: InstitucionPickerViewControllerDelegate?
    
    // The most recent data download task. We keep a reference to it so that it can be cancelled every time the search text changes
    var searchTask: URLSessionDataTask?
    
    var institucion: Institucion?
    
    @IBOutlet weak var institucionSearchBar: UISearchBar!
    
    @IBOutlet weak var institucionTableView: UITableView!
    // MARK: Life Cycle
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        
    }
    
    override func viewDidLoad() {
        //parent!.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: #selector(logout))
        
        // configure tap recognizer
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap(_:)))
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.delegate = self
        view.addGestureRecognizer(tapRecognizer)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }
    
    // MARK: Dismissals
    func handleSingleTap(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    private func cancel() {
        delegate?.institucionPicker(self, didPickInstitucion: nil)
        logout()
    }
    
    func logout() {
        dismiss(animated: true, completion: nil)
    }
}


// MARK: - InstitucionPickerViewController: UIGestureRecognizerDelegate

extension InstitucionPickerViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return institucionSearchBar.isFirstResponder
    }
}

// MARK: - InstitucionPickerViewController: UISearchBarDelegate

extension InstitucionPickerViewController: UISearchBarDelegate {
    
    // each time the search text changes we want to cancel any current download and start a new one
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // cancel the last task
        if let task = searchTask {
            task.cancel()
        }
        
        // if the text is empty we are done
        if searchText == "" {
            instituciones = [Institucion]()
            institucionTableView?.reloadData()
            return
        }
        
        // new search
        searchTask = CPCCSClient.sharedInstance().getInstitucionesForSearchString(searchText) { (instituciones, error) in
            self.searchTask = nil
            if let instituciones = instituciones {
                self.instituciones = instituciones
                performUIUpdatesOnMain {
                    self.institucionTableView!.reloadData()
                }
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

// MARK: - InstitucionPickerViewController: UITableViewDelegate, UITableViewDataSource

extension InstitucionPickerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let CellReuseId = "InstitucionSearchCell"
        let institucion = instituciones[(indexPath as NSIndexPath).row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseId) as UITableViewCell!
        
        cell?.textLabel!.text = "\(institucion.nombre)"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return instituciones.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let institucion = instituciones[(indexPath as NSIndexPath).row]
        self.institucion = institucion
        performSegue(withIdentifier: "UnwindToDenunciaID", sender: self)
    }
}


