import UIKit

class PaginacionViewController: UIPageViewController, UIPageViewControllerDataSource {
   
    var paginacion = [Pasos]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let primerPaso = Pasos(index: 0, tituloTuto: "PRIMER PASO", contenidoTuto: "DESCRIPCION DEL PRIMER PASO")
        paginacion.append(primerPaso)
        let segundoPaso = Pasos(index: 1, tituloTuto: "SEGUNDO PASO", contenidoTuto: "DESCRIPCION DEL SEGUNDO PASO")
        paginacion.append(segundoPaso)
        let tercerPaso = Pasos(index: 2, tituloTuto: "TERCER PASO", contenidoTuto: "DESCRIPCION DEL TERCER PASO")
        paginacion.append(tercerPaso)
        
        dataSource = self
        if let inicioCopntroller = paginacionController(index: 0){
            setViewControllers([inicioCopntroller], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    func botonSiguiente(index: Int){
        if let siguienteController = paginacionController(index: index + 1){
            setViewControllers([siguienteController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func botonAtras(index: Int){
        if let atrasController = paginacionController(index: index - 1){
            setViewControllers([atrasController], direction: .reverse, animated: true, completion: nil)
        }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! TutorialViewController).pasos.index
        index -= 1
        return paginacionController(index: index)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! TutorialViewController).pasos.index
        index += 1
        return paginacionController(index: index)
    }
    
    func paginacionController(index: Int)-> TutorialViewController?{
        if index < 0 || index >= 3 {
            return nil
        }
        
        if let contenido = storyboard?.instantiateViewController(withIdentifier: "tutorialHijo") as? TutorialViewController {
            contenido.pasos = self.paginacion[index]
            return contenido
        }
        return nil
    }

   

}
