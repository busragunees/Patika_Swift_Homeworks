//
//  ViewController.swift
//  WalletApp
//
//  Created by Büşra Güneş on 8.09.2022.
//

import UIKit

class HomeViewController: UIViewController {
   
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var expenceList = [ExpenseModel](arrayLiteral: ExpenseModel(price: 35.0, date: "06.09.2022", description: "Kahve siparişim", category: CategoryType.coffee),ExpenseModel(price: 3555.0, date: "09.09.2022", description: "Bosna gezisi", category: CategoryType.travel))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //delegate and data source from extencion
        tableView.delegate = self
        tableView.dataSource = self
        
        //button style
        addButton.layer.cornerRadius = 30
    }

    // MARK: - Button action and closure structure
    @IBAction func didTabButton(){
        addButton.showAnimation {}
        let viewController = storyboard?.instantiateViewController(withIdentifier: "second") as! AddExpenseViewController
        viewController.modalPresentationStyle = .fullScreen
        
        viewController.completionHandler = {expense in
    
            self.expenceList.append((expense as? ExpenseModel)!)
            print("this is expense count" ,self.expenceList.count)
            self.tableView.reloadData()
            
        }
        present(viewController,animated: true)
    }
}

   // MARK: - list data return extencion
extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenceList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath) as! ExpenseCellTableViewCell
        let expense = expenceList[indexPath.row]
        cell.priceLabel.text = String(expense.price!) + "₺"
        cell.categoryName.text = expense.category?.name
        cell.descriptionLabel.text = expense.description
        cell.categoryImage.image = expense.category?.img
        cell.dateLabel.text = expense.date
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
