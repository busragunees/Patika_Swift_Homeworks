//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Büşra Güneş on 22.09.2022.
//

import UIKit

class ToDoViewController: UIViewController {
    
    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var addTargetButton: UIButton!
    
    @IBAction func goToAddToDo(_ sender: Any) {
        let addToDoVC = self.storyboard?.instantiateViewController(withIdentifier: "addToDoVC") as! AddToDoViewController
        self.navigationController?.pushViewController(addToDoVC, animated: true)
    }
    
    private var todoList: [ToDoEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
        addTargetButton.layer.cornerRadius = 16
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchData()
    }
    
    //MARK: - It pulls todo data from DB and reloads it to table view.
    
    private func fetchData() {
        StorageManager.shared.fetchData { result in
            switch result {
            case .success(let todoList):
                self.todoList = todoList
                self.todoTableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    private func navigateEditVC(row:Int){
        let editToDoVC = self.storyboard?.instantiateViewController(withIdentifier: "editToDoVC") as! EditToDoViewController
        editToDoVC.selectedToDo = self.todoList[row]
        self.navigationController?.pushViewController(editToDoVC, animated: true)
    }

}


extension ToDoViewController {
    private func deleteSwipeAction(rowIndexPathAt indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { [self] _, _, _ in
            StorageManager.shared.deleteToDo(todo: self.todoList[indexPath.row])
            todoList.remove(at: indexPath.row)
            self.todoTableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return action
    }
    
    private func editSwipeAction(rowIndexPathAt indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "Edit") { _, _, _ in
            self.navigateEditVC(row: indexPath.row)
            self.todoTableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        return action
    }
}

extension ToDoViewController : UITableViewDelegate, UITableViewDataSource{
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // #warning Incomplete implementation, return the number of rows
           return todoList.count
       }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! ToDoTableViewCell

       cell.setItem(item: todoList[indexPath.row])

       return cell
   }
    
     func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = self.editSwipeAction(rowIndexPathAt: indexPath)
        let delete = self.deleteSwipeAction(rowIndexPathAt: indexPath)
        let swipe = UISwipeActionsConfiguration(actions: [delete, edit])
        
        return swipe
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         self.navigateEditVC(row: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
