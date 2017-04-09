import UIKit
// MARK: - InstitucionPedidos3ControllerDelegate

protocol InstitucionPedidos3ControllerDelegate {
    func institucionPicker(_ institucionPicker: InstitucionPedidos3Controller, didPickInstitucion institucion: Institucion?)
}

class InstitucionPedidos3Controller: UIViewController {
    // MARK: Properties
    // Los datos para la tabla
    var instituciones = [Institucion]()
    
    // the delegate will typically be a view controller, waiting for the Institucion Picker to return an institucion
    var delegate: InstitucionPedidos3ControllerDelegate?
    
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


// MARK: - InstitucionPedidos3Controller: UIGestureRecognizerDelegate

extension InstitucionPedidos3Controller: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return institucionSearchBar.isFirstResponder
    }
}

// MARK: - InstitucionPedidos3Controller: UISearchBarDelegate

extension InstitucionPedidos3Controller: UISearchBarDelegate {
    
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

// MARK: - InstitucionPedidos3Controller: UITableViewDelegate, UITableViewDataSource

extension InstitucionPedidos3Controller: UITableViewDelegate, UITableViewDataSource {
    
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
        performSegue(withIdentifier: "UnwindToPedido3ID", sender: self)
    }
}


