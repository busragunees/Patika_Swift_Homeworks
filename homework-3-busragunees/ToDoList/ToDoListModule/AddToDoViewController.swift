//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by Büşra Güneş on 22.09.2022.
//

import UIKit

class AddToDoViewController: UIViewController {
  
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var addListButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTextView.layer.cornerRadius = 10
        addListButton.layer.cornerRadius = 16
    }
    
  
    @IBAction func addToDoAction(_ sender: UIButton) {
        sender.showAnimation { self.addToDo()}
        
    }
    
  private func addToDo(){
        if let note = noteTextView.text {
            StorageManager.shared.addToDo(note, isCompleted: false) { todo in
                navigationController?.popViewController(animated: true)
            }
        }
       
    }
}
