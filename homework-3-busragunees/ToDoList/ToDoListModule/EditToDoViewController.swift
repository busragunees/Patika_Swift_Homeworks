//
//  EditToDoViewController.swift
//  ToDoList
//
//  Created by Büşra Güneş on 22.09.2022.
//

import UIKit

class EditToDoViewController: UIViewController {

    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var completedSwitch: UISwitch!
    @IBOutlet weak var editButton: UIButton!
    
    var selectedToDo:ToDoEntity! = nil
    //MARK: - Edit data.
    
    @IBAction func editAction(_ sender: UIButton) {
        sender.showAnimation {}
        StorageManager.shared.editToDo(todo: selectedToDo, note: noteTextView.text, isCompleted: completedSwitch.isOn,  completion: {
            navigationController?.popViewController(animated: true)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTextView.layer.cornerRadius = 10
        editButton.layer.cornerRadius = 16

        if let todo = selectedToDo {
            noteTextView.text = todo.note
        }

        completedSwitch.setOn(selectedToDo.isCompleted, animated: true)
        
    }
  

}
