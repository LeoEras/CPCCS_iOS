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
        //parametersWithApiKey[ParameterKeys.ApiKey] = Constants.ApiKey as AnyObject?
        
        /* 2/3. Build the URL, Configure the request */
        let request = NSMutableURLRequest(url: cpccsURLFromParameters(parametersWithApiKey, withPathExtension: method))
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonBody.data(using: String.Encoding.utf8)
        
        /* 4. Make the request */
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            func sendError(_ error: String) {
                print(error)
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandlerForPOST(nil, NSError(domain: "taskForGETMethod", code: 1, userInfo: userInfo))
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

// MARK: - Institucion Struct

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


