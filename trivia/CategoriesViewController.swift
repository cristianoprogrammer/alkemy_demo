//
//  TableViewController.swift
//  trivia
//
//  Created by Cristiano Douglas on 02/09/22.
//

import UIKit
import Alamofire

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var service = CategoriesService()
    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        obterCidades()
    }
    
    func obterCidades() {
        
        service.getCategories { categories in
            self.categories = categories
            self.tableView.reloadData()
        }
        
    }
    
    private func showQuestions() {
        
        let viewController = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
        navigationController?.popToRootViewController(animated: true)
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
}

extension CategoriesViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CategoryTableViewCell else {
            return UITableViewCell()
        }
        
        let category = self.categories[indexPath.row]
        let nome = "\(indexPath.row) - \(category.name)"
        cell.setCell(title: nome, description: "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
}

extension CategoriesViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Item selecionado: \(indexPath.row)")
        let category = self.categories[indexPath.row]
        print("Category: \(category.name)")
        showQuestions()
        
//        service.createCategory(id: 35, name: "Nova Categoria") { message in
//            print("Criação de categoria: " + message)
//        }
        
    }
    
}
