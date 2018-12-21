import WebKit
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var wkWebView: WKWebView!
    var definicion:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buscar(_ sender: Any) {
        definicion = textField.text!
        let urlWiki = "https://es.wikipedia.org/w/api.php?action=query&prop=extracts&format=json&exintro=&titles=\(definicion!)"
        let urlObjeto = URL(string:urlWiki)
        let tarea = URLSession.shared.dataTask(with: urlObjeto!) { (datos, respuesta, error) in
            if error == nil {
                do{
                    let json = try JSONSerialization.jsonObject(with: datos!, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                    print(json)
                }catch {
                    print("El Procesamiento del JSON tuvo un error")
                }
            } else {
                print(error!)
            }
        }
        tarea.resume()
    }
}
