import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (UserDefaults.standard.object(forKey: "tuto") != nil) {
            return
        }else{
            if let inicioVC = storyboard?.instantiateViewController(withIdentifier: "tutorial") as? PaginacionViewController {
                self.present(inicioVC, animated: true, completion: nil)
            }
        }
        
    }

    


}

