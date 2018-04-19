import UIKit
struct Pasos {
    var index = 0
    var tituloTuto = ""
    var contenidoTuto = ""
}
class TutorialViewController: UIViewController {

    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var contenido: UITextView!
    
    @IBOutlet weak var botonFinalizar: UIButton!
    @IBOutlet weak var control: UIPageControl!
    @IBOutlet weak var botonAtras: UIButton!
    @IBOutlet weak var botonSiguiente: UIButton!
    
    var pasos : Pasos!
    override func viewDidLoad() {
        super.viewDidLoad()
        titulo.text = pasos.tituloTuto
        contenido.text = pasos.contenidoTuto
        control.currentPage = pasos.index
        botonFinalizar.isHidden = true
        if pasos.index == 2 {
            botonFinalizar.isHidden = false
        }
        
        if pasos.index == 0  {
            botonAtras.isHidden = true
        }
        if pasos.index == 2  {
            botonSiguiente.isHidden = true
        }
        
        
    }
    
    @IBAction func finalizar(_ sender: UIButton) {
        UserDefaults.standard.set("visto", forKey: "tuto")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func atras(_ sender: UIButton) {
        let atras = parent as? PaginacionViewController
        atras?.botonAtras(index: pasos.index)
    }
    
    @IBAction func siguiente(_ sender: UIButton) {
        let siguiente = parent as? PaginacionViewController
        siguiente?.botonSiguiente(index: pasos.index)
        
    }
    
   

}
