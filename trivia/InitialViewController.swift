//
//  InitialViewController.swift
//  trivia
//
//  Created by Cristiano Douglas on 29/08/22.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var imgViewLogo: UIImageView!
    @IBOutlet weak var txtFieldUsuario: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtFieldUsuario.text = ""
        addConstraints()
    }
    
    func addConstraints() {
        
        imgViewLogo.translatesAutoresizingMaskIntoConstraints = false
        imgViewLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        imgViewLogo.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imgViewLogo.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        let centerHorizontal = imgViewLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        NSLayoutConstraint.activate([centerHorizontal])
    }
    
    @IBAction func actionClickFinalizar(_ sender: Any) {
        guard let nome = txtFieldUsuario.text else { return }
        
        if !nome.isEmpty {
            
//            let viewController = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
            let viewController = CategoriesViewController(nibName: "TableViewController", bundle: nil)
            let navigationController = UINavigationController(rootViewController: viewController)
            self.present(navigationController, animated: true)
            
        } else {
            print("Por favor insira um nome!")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
